import 'package:flutter/material.dart';
import 'package:hinduism/firebase_options.dart';
import 'package:hinduism/flavors/flavor_config.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hinduism/main.dart';

void mainCommon(
    {required Flavor flavor,
    required String baseUrl,
    required String name}) async {
  FlavorConfig(flavor: flavor, baseUrl: baseUrl, name: name);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}
