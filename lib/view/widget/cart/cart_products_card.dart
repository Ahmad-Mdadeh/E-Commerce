import 'package:e_commerce/logic/controllers/cart_controller.dart';
import 'package:e_commerce/model/products.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

CartController cartController = Get.find<CartController>();

class CartProductsCard extends StatelessWidget {
  final Products products;
  final int quantity;
  final int index;

  const CartProductsCard({
    required this.products,
    required this.quantity,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 5.0,
      ),
      width: 100,
      height: 130,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.5)
            : mainColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(products.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  textOverflow: TextOverflow.ellipsis,
                  text: products.title,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextUtils(
                  textOverflow: TextOverflow.ellipsis,
                  text:
                      '\$${cartController.productsSupTotal[index].toStringAsFixed(2)}',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      cartController.removeProductsFromCart(products);
                    },
                    icon: Icon(Icons.remove_circle),
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  TextUtils(
                    text: '$quantity',
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      cartController.addProductsToCart(products);
                    },
                    icon: Icon(Icons.add_circle),
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ],
              ),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  cartController.removeOneProductsFromCart(products);
                },
                icon: Icon(
                  Icons.delete,
                  color: Get.isDarkMode
                      ? Colors.black
                      : Colors.pink.withOpacity(1.0),
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
