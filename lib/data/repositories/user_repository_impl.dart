import 'package:dartz/dartz.dart';
import 'package:hinduism/core/errors/failures.dart';
import 'package:hinduism/core/network/network_info.dart';
import 'package:hinduism/data/datasources/local/local_data_source.dart';
import 'package:hinduism/data/datasources/remote/remote_data_source.dart';
import 'package:hinduism/domain/entities/user.dart';
import 'package:hinduism/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<User>>> getUsers({String? cancelToken}) async {
    try {
      if (await networkInfo.isConnected) {
        final users = await remoteDataSource.getUsers(cancelToken: cancelToken);
        await localDataSource.cacheUsers(users);
        return Right(users);
      } else {
        final cachedUsers = await localDataSource.getCachedUsers();
        return Right(cachedUsers);
      }
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<User>>> searchUsers(
    String query, {
    String? cancelToken,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        final users = await remoteDataSource.searchUsers(
          query,
          cancelToken: cancelToken,
        );
        return Right(users);
      } else {
        final cachedUsers = await localDataSource.getCachedUsers();
        final filteredUsers = cachedUsers
            .where((user) =>
                user.name.toLowerCase().contains(query.toLowerCase()) ||
                user.email.toLowerCase().contains(query.toLowerCase()))
            .toList();
        return Right(filteredUsers);
      }
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}