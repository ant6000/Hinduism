import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hinduism/data/models/login_model.dart';
import 'package:hinduism/data/models/user_profile.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<LoginData> login(String username, String password) async {
    try {
      final response = await _dio.post('/login', data: {
        'username': username,
        'password': password,
      });
      return LoginData.fromJson(response.data['data']);
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? 'Login failed. Please try again.';
      throw Exception(message);
    }
  }

  Future<UserProfile> userProfile(String authToken) async {
    try {
      final response = await _dio.get('/user-profile',
          options: Options(headers: {'Authorization': 'Bearer $authToken'}));
      return UserProfile.fromJson(response.data['data']);
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? 'User Profile failed. Please try again.';
      throw Exception(message);
    }
  }
}

final dioProvider = Provider<Dio>((ref) {
  final baseUrl = FlavorConfig.instance.variables['baseUrl'] as String;
  return Dio(BaseOptions(baseUrl: baseUrl));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(dioProvider));
});
