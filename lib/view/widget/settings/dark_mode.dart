import 'package:e_commerce/logic/controllers/settings_controller.dart';
import 'package:e_commerce/logic/controllers/theme_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
  final settingController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
            activeTrackColor: pinkClr,
            activeColor: pinkClr,
            value: settingController.switchValue.value,
            onChanged: (value) {
              ThemeController().chengTheme();
              settingController.switchValue.value = value;
              settingController.switchData.write('isSwitched', settingController.switchValue.value);

            },
          )
        ],
      );
    });
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(
              6.0,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          TextUtils(
            text: 'Dark Mode',
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          )
        ],
      ),
    );
  }
}
