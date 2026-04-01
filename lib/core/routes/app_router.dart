import 'package:go_router/go_router.dart';
import 'package:hinduism/core/routes/app_routes.dart';
import 'package:hinduism/core/routes/navigation_helper.dart';
import 'package:hinduism/presentation/screens/login_page.dart';


GoRouter appRouter = GoRouter(
  navigatorKey: NavigationHelper().parentNavigatorKey,
  initialLocation: AppRoutes.login,
  observers: [RouteNavigatorObserver()],
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.login,
      name: 'Login',
      builder: (context, state) =>  LoginPage(),
    ),
    
  ],
);