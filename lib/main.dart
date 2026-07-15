import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:hinduism/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hinduism/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SharedPreferences.getInstance();

  FlavorConfig(
      name: "PROD",
      color: Colors.red,
      location: BannerLocation.topStart,
      variables: {"baseUrl": "https://track.itracker.com.bd/api/v2"});
      
  runApp(const ProviderScope(child: MyApp()));
}
