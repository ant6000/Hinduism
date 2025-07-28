import 'package:flutter/material.dart';
import 'package:hinduism/flavor_config.dart';
import 'package:hinduism/main.dart';
void main() {
  FlavorConfig(
    flavor: Flavor.stage,
    values: FlavorValues(
      baseUrl: "https://thecoder-stage.com/api/v1/",
      version: "V1.0.0-Stage",
      name: "The Coder Stage Flavor",
    ),
  );
  runApp(const MyApp());
}