import 'package:e_commerce/logic/controllers/main_controller.dart';
import 'package:e_commerce/logic/controllers/settings_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
    Get.put<SettingController>(SettingController());
  }
}