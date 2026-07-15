import 'package:go_router/go_router.dart';
import 'package:hinduism/core/routes/app_routes.dart';
import 'package:hinduism/core/routes/navigation_helper.dart';
import 'package:hinduism/presentation/screens/counter_screen.dart';
import 'package:hinduism/presentation/screens/login_page.dart';
import 'package:hinduism/presentation/screens/main_home.dart';
import 'package:hinduism/presentation/screens/user_profile_screen.dart';


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
    GoRoute(
      path: AppRoutes.home,
      name: 'Home',
      builder: (context, state) =>  HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.error,
      name: 'Error',
      builder: (context, state) =>  LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.test,
      name: 'Test',
      builder: (context, state) =>  CounterScreen(),
    ),
    GoRoute(
      path: AppRoutes.userProfile,
      name: 'Profile',
      builder: (context, state) =>  UserProfileScreen(),
    ),
    
  ],
);