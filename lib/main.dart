import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hinduism/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hinduism/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlavorConfig(
      name: "PROD",
      color: Colors.red,
      location: BannerLocation.topStart,
      variables: {
        "baseUrl": "https://www.example.com.dev",
      });
  runApp(const MyApp());
}
