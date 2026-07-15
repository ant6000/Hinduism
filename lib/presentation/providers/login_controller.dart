import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hinduism/core/routes/app_routes.dart';
import 'package:hinduism/data/models/user_profile.dart';
import 'package:hinduism/presentation/providers/auth_repo.dart';

class LoginController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> login(String username, String password, BuildContext context) async {
    if (username.isEmpty || password.isEmpty) {
      return;
    }
    final repo = ref.read(authRepositoryProvider);

    state = const AsyncLoading();
    final result = await AsyncValue.guard(() => repo.login(username, password));
    state = result;
    if (result.value?.token != null && context.mounted) {
      context.go(AppRoutes.userProfile);
    }
  }
}

final loginControllerProvider = AsyncNotifierProvider<LoginController, void>(LoginController.new);

class UserProfileController extends AsyncNotifier<UserProfile> {
  @override
  FutureOr<UserProfile> build() {
    final authToken = '8d86da5f-9c2a-4bdc-ad83-64aa1999a16c';
    if (authToken.isEmpty) {
      return UserProfile();
    }
    final repo = ref.read(authRepositoryProvider);
    return repo.userProfile(authToken);
  }
}

final userProfileControllerProvider =
    AsyncNotifierProvider<UserProfileController, UserProfile>(UserProfileController.new);