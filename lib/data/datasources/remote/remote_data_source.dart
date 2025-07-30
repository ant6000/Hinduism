import 'package:hinduism/core/network/dio_client.dart';
import 'package:hinduism/data/models/post_model.dart';
import 'package:hinduism/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<List<UserModel>> getUsers({String? cancelToken});
  Future<List<PostModel>> getPosts({
    int page = 1,
    int limit = 20,
    String? cancelToken,
  });
  Future<List<UserModel>> searchUsers(String query, {String? cancelToken});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final DioClient dioClient;

  RemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<UserModel>> getUsers({String? cancelToken}) async {
    final response = await dioClient.get(
      '/users',
      cancelToken: cancelToken,
    );
    
    final List<dynamic> jsonList = response.data;
    return jsonList.map((json) => UserModel.fromJson(json)).toList();
  }

  @override
  Future<List<PostModel>> getPosts({
    int page = 1,
    int limit = 20,
    String? cancelToken,
  }) async {
    final response = await dioClient.get(
      '/posts',
      queryParameters: {
        '_page': page,
        '_limit': limit,
      },
      cancelToken: cancelToken,
    );
    
    final List<dynamic> jsonList = response.data;
    return jsonList.map((json) => PostModel.fromJson(json)).toList();
  }

  @override
  Future<List<UserModel>> searchUsers(String query, {String? cancelToken}) async {
    final response = await dioClient.get(
      '/users',
      queryParameters: {'q': query},
      cancelToken: cancelToken,
    );
    
    final List<dynamic> jsonList = response.data;
    return jsonList
        .map((json) => UserModel.fromJson(json))
        .where((user) => 
            user.name.toLowerCase().contains(query.toLowerCase()) ||
            user.email.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}