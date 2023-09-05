import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/settings/dark_mode.dart';
import 'package:e_commerce/view/widget/settings/language.dart';
import 'package:e_commerce/view/widget/settings/logout.dart';
import 'package:e_commerce/view/widget/settings/profile.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AuthController controller = Get.find();

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(
          24.0,
        ),
        children: [
          Profile(),
          const SizedBox(
            height: 10.0,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextUtils(
            text: 'GENERAL',
            color: Get.isDarkMode ? pinkClr : mainColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20.0,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20.0,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}
