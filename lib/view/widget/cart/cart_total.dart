import 'package:e_commerce/logic/controllers/cart_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: 'Total',
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  TextUtils(
                    height: 1.5,
                    text: '\$${controller.total}',
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ],
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: SizedBox(
                  height: 60.0,
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
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          text: 'Check Out',
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20.0,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.shopping_cart,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },);
  }
}
