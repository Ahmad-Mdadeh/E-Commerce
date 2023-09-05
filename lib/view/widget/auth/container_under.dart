import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textButton;
  final Function() function;

  ContainerUnder({
    required this.text,
    required this.textButton,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.125,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? pinkClr : mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 18.0,
          ),
          TextButton(
            onPressed: function,
            child: TextUtils(
              text: textButton,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 18.0,
              textDecoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}
