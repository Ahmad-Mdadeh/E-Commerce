import 'package:e_commerce/view/widget/category/category_widget.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0),
              child: TextUtils(
                text: 'Categories',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          CategoryWidget(),
        ],
      ),
    );
  }
}
