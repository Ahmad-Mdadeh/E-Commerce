import 'package:e_commerce/logic/controllers/cart_controller.dart';
import 'package:e_commerce/model/products.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
  final double price;
  final Products products;

  const AddCart({
    required this.price,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Container(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: 'Price',
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              TextUtils(
                height: 1.5,
                text: '\$$price',
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
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Get.isDarkMode ? pinkClr : mainColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {
                  cartController.addProductsToCart(products);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                      text: 'Add to Cart',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
