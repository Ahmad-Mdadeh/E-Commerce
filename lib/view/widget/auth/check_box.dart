import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AuthController controller = Get.find();

class CheckBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                      ? Icon(
                          Icons.check,
                          size: 30.0,
                          color: pinkClr,
                        ) : Image.asset("assets/images/check.png",)
                  : Container(),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          TextUtils(
            text: "I accept",
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 16.0,
          ),
          SizedBox(
            width: 6.0,
          ),
          TextUtils(
            text: "terms & conditions",
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 16.0,
            textDecoration: TextDecoration.underline,
          ),
        ],
      );
    });
  }
}
