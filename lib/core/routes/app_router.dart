import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hinduism/core/routes/app_routes.dart';
import 'package:hinduism/core/routes/navigation_helper.dart';
import 'package:hinduism/presentation/screens/login_page.dart';

abstract class _Path {
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String accommodation =
      '/accommodation/:accommodationId/:instanceId';
}

abstract class PathParameter {
  static const String destinationId = 'destinationId';
  static const String accommodationId = 'accommodationId';
  static const String instanceId = 'instanceId';
  static const String name = 'name';
  static const String images = 'images';
  static const String visible = 'true';
}

GoRouter appRouter = GoRouter(
  navigatorKey: NavigationHelper().parentNavigatorKey,
  initialLocation: _Path.onboarding,
  observers: [RouteNavigatorObserver()],
  routes: <RouteBase>[
    GoRoute(
      path: _Path.onboarding,
      name: AppRoutes.onboarding,
      builder: (context, state) =>  LoginPage(),
    ),
    // GoRoute(
    //   path: _Path.error,
    //   name: AppRoutes.error,
    //   builder: (context, state) => const ErrorScreen(),
    // ),
  ],
  // errorPageBuilder: (context, state) {
  //   return MaterialPage<void>(
  //     key: state.pageKey,
  //     child: ErrorScreen(
  //       errorMessage: context.localization.pageNotFound,
  //       onPressed: () {
  //         context.pop();
  //       },
  //     ),
  //   );
  // },
);

void popUntilHome(BuildContext context) {
  final router = GoRouter.of(context);
  while (router
          .routerDelegate
          .currentConfiguration
          .matches
          .last
          .matchedLocation !=
      _Path.home) {
    if (!context.canPop()) {
      return;
    }
    context.pop();
  }
}
