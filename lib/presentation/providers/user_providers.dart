import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hinduism/data/datasources/local/local_data_source.dart';
import 'package:hinduism/data/datasources/remote/remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/dio_client.dart';
import '../../core/network/network_info.dart';
import '../../core/utils/debouncer.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_users.dart';

// Network Info Provider
final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl(ref.watch(connectivityProvider));
});

// Shared Preferences Provider
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance();
});

// Data Sources
final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider).value;
  return LocalDataSourceImpl(sharedPreferences: sharedPrefs!);
});

final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
  return RemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider));
});

// Repository
final userRepositoryProvider = Provider<UserRepositoryImpl>((ref) {
  return UserRepositoryImpl(
    remoteDataSource: ref.watch(remoteDataSourceProvider),
    localDataSource: ref.watch(localDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
  );
});

// Use Cases
final getUsersUseCaseProvider = Provider<GetUsers>((ref) {
  return GetUsers(ref.watch(userRepositoryProvider));
});

// UI State Classes
class UserListState {
  final List<User> users;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final bool hasReachedMax;
  final bool isOffline;

  const UserListState({
    this.users = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.hasReachedMax = false,
    this.isOffline = false,
  });

  UserListState copyWith({
    List<User>? users,
    bool? isLoading,
    bool? isLoadingMore,
    String? error,
    bool? hasReachedMax,
    bool? isOffline,
  }) {
    return UserListState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isOffline: isOffline ?? this.isOffline,
    );
  }
}

// User List Provider with all features
class UserListNotifier extends StateNotifier<UserListState> {
  final GetUsers _getUsers;
  final UserRepositoryImpl _repository;
  final NetworkInfo _networkInfo;
  final DioClient _dioClient;
  final Debouncer _searchDebouncer;

  static const String _getUsersToken = 'get_users';
  static const String _searchToken = 'search_users';

  UserListNotifier(
    this._getUsers,
    this._repository,
    this._networkInfo,
    this._dioClient,
  ) : _searchDebouncer = Debouncer(delay: const Duration(milliseconds: 500)),
      super(const UserListState()) {
    _init();
  }

  void _init() {
    _networkInfo.onConnectivityChanged.listen((isConnected) {
      state = state.copyWith(isOffline: !isConnected);
      if (isConnected && state.users.isEmpty) {
        loadUsers();
      }
    });
    loadUsers();
  }

  Future<void> loadUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      _dioClient.cancelRequest(_getUsersToken);
      state = state.copyWith(
        isLoading: true,
        error: null,
        users: [],
        hasReachedMax: false,
      );
    } else if (state.isLoading) {
      return;
    } else {
      state = state.copyWith(isLoading: true, error: null);
    }

    final result = await _getUsers(cancelToken: _getUsersToken);
    
    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: _getErrorMessage(failure),
        );
      },
      (users) {
        state = state.copyWith(
          isLoading: false,
          users: users,
          error: null,
        );
      },
    );
  }

  Future<void> searchUsers(String query) async {
    if (query.isEmpty) {
      loadUsers(isRefresh: true);
      return;
    }

    _searchDebouncer(() async {
      _dioClient.cancelRequest(_searchToken);
      
      state = state.copyWith(isLoading: true, error: null);

      final result = await _repository.searchUsers(
        query,
        cancelToken: _searchToken,
      );

      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: _getErrorMessage(failure),
          );
        },
        (users) {
          state = state.copyWith(
            isLoading: false,
            users: users,
            error: null,
          );
        },
      );
    });
  }

  String _getErrorMessage(failure) {
    if (failure.runtimeType.toString().contains('NetworkFailure')) {
      return 'No internet connection';
    }
    return 'Something went wrong. Please try again.';
  }

  @override
  void dispose() {
    _searchDebouncer.dispose();
    _dioClient.cancelRequest(_getUsersToken);
    _dioClient.cancelRequest(_searchToken);
    super.dispose();
  }
}

final userListProvider = StateNotifierProvider<UserListNotifier, UserListState>((ref) {
  return UserListNotifier(
    ref.watch(getUsersUseCaseProvider),
    ref.watch(userRepositoryProvider),
    ref.watch(networkInfoProvider),
    ref.watch(dioClientProvider),
  );
});