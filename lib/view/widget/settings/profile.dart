import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:e_commerce/logic/controllers/settings_controller.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  final settingController = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Row(
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(authController.userPhotoUrl.value),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: settingController
                        .capitalize(authController.userName.value),
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                  TextUtils(
                    text: authController.userEmail.value,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}
