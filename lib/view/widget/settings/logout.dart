import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:e_commerce/logic/controllers/settings_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOutWidget extends StatelessWidget {
  final settingController = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
              backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
              title: 'Log Out From App',
              titleStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              radius: 10.0,
              middleText: 'Are you sure you want to log out ?',
              middleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
              textCancel: 'No',
              cancelTextColor: Colors.white,
              buttonColor: Get.isDarkMode ? Colors.pink : Colors.teal,
              onCancel: () {
                Get.back();
              },
              textConfirm: 'Yes',
              confirmTextColor: Colors.white,
              onConfirm: () {
                authController.signOutFromApp();
              },
            );
          },
          splashColor: Get.isDarkMode
              ? pinkClr.withOpacity(0.4)
              : mainColor.withOpacity(0.4),
          highlightColor: Get.isDarkMode
              ? pinkClr.withOpacity(0.4)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12.0),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              TextUtils(
                text: 'LogOut',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              )
            ],
          ),
        ),
      );
    });
  }
}
