import 'package:get/get.dart';
import 'package:hinduism/controller/settings_controller.dart';

class SettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}
