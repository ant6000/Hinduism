import 'package:flutter/material.dart';
import 'package:hinduism/main.dart';
import 'flavor_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.dev,
    values: FlavorValues(
      baseUrl: "https://thecoder-dev.com/api/v1/",
      version: "V1.0.0-Dev",
      name: "The Coder Dev Flavor",
    ),
  );
  runApp(const MyApp());
}