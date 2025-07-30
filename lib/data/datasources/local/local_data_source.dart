import 'dart:convert';
import 'package:hinduism/data/models/post_model.dart';
import 'package:hinduism/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class LocalDataSource {
  Future<List<UserModel>> getCachedUsers();
  Future<void> cacheUsers(List<UserModel> users);
  Future<List<PostModel>> getCachedPosts();
  Future<void> cachePosts(List<PostModel> posts);
  Future<void> clearCache();
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  
  static const String _usersKey = 'cached_users';
  static const String _postsKey = 'cached_posts';

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<UserModel>> getCachedUsers() async {
    final jsonString = sharedPreferences.getString(_usersKey);
    if (jsonString != null) {
      final jsonList = json.decode(jsonString) as List;
      return jsonList.map((json) => UserModel.fromJson(json)).toList();
    }
    throw Exception('No cached users found');
  }

  @override
  Future<void> cacheUsers(List<UserModel> users) async {
    final jsonString = json.encode(users.map((user) => user.toJson()).toList());
    await sharedPreferences.setString(_usersKey, jsonString);
  }

  @override
  Future<List<PostModel>> getCachedPosts() async {
    final jsonString = sharedPreferences.getString(_postsKey);
    if (jsonString != null) {
      final jsonList = json.decode(jsonString) as List;
      return jsonList.map((json) => PostModel.fromJson(json)).toList();
    }
    throw Exception('No cached posts found');
  }

  @override
  Future<void> cachePosts(List<PostModel> posts) async {
    final jsonString = json.encode(posts.map((post) => post.toJson()).toList());
    await sharedPreferences.setString(_postsKey, jsonString);
  }

  @override
  Future<void> clearCache() async {
    await sharedPreferences.remove(_usersKey);
    await sharedPreferences.remove(_postsKey);
  }
}