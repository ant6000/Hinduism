import 'package:flutter/material.dart';
import 'package:hinduism/flavor_config.dart';
import 'package:hinduism/main.dart';
void main() {
  FlavorConfig(
    flavor: Flavor.prod,
    values: FlavorValues(
      baseUrl: "https://thecoder-prod.com/api/v1/",
      version: "V1.0.0-Pro",
      name: "The Coder Pro Flavor",
    ),
  );
  runApp(const MyApp());
}