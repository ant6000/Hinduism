import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hinduism/core/routes/app_router.dart';
import 'package:hinduism/core/utils/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, _) {
          return FlavorBanner(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              routerConfig: appRouter,
            ),
          );
        });
  }
}