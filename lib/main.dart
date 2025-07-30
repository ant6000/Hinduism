import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hinduism/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hinduism/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hinduism/presentation/providers/user_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FlavorConfig(
  //     name: "PROD",
  //     color: Colors.red,
  //     location: BannerLocation.topStart,
  //     variables: {
  //       "baseUrl": "https://www.example.com.dev",
  //     });
  runApp( ProviderScope(
    child: MyApp()));
}
