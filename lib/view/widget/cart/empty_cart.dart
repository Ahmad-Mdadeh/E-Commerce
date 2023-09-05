import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150.0,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 40.0,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Your Cart is ',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Empty',
                  style: TextStyle(
                    color: Get.isDarkMode ? pinkClr : mainColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextUtils(
            text: 'Add items to get Started',
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
          ),
          const SizedBox(
            height: 50.0,
          ),
          SizedBox(
            height: 50.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Get.isDarkMode ? pinkClr : mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                ),
              ),
              onPressed: () {
                Get.toNamed(Routes.mainScreen);
              },
              child: TextUtils(
                text: 'Get to Home',
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
