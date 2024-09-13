import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isDarkMode = false.obs;
  void changeTheme(bool value) {
    Get.changeTheme(value ? ThemeData.dark() : ThemeData.light());
    isDarkMode.value = value;
  }
}
