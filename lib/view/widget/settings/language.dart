import 'package:e_commerce/utils/my_string.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(
                  6.0,
                ),
                child: const Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: languageSettings,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              TextUtils(
                text: 'Language',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              )
            ],
          ),
        ),
        Container(
          width: 120.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 6.0,
            vertical: 2.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              13.0,
            ),
            border: Border.all(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              width: 2.0,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: eng,
              onChanged: (value) {
                eng = value!;
              },
              iconSize: 25.0,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              items: [
                DropdownMenuItem(
                  value: ara,
                  child: TextUtils(
                    text: arabic,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                DropdownMenuItem(
                  value: eng,
                  child: TextUtils(
                    text: english,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                DropdownMenuItem(
                  value: fre,
                  child: TextUtils(
                    text: french,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
