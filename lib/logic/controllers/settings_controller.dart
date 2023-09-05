import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  RxBool switchValue = false.obs;
  final switchData = GetStorage();

  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

  @override
  void onInit() {
    super.onInit();
    if (switchData.read('isSwitched') != null) {
      switchValue.value = switchData.read('isSwitched');
    }
  }
}
