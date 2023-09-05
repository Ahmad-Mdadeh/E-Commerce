import 'package:e_commerce/logic/controllers/cart_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/cart/cart_products_card.dart';
import 'package:e_commerce/view/widget/cart/cart_total.dart';
import 'package:e_commerce/view/widget/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

CartController controller = Get.find<CartController>();

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text("Cart Items"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProductsFromCart();
              },
              icon: Icon(Icons.backspace),
            ),
          ],
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkColor : mainColor,
        ),
        body: Obx(() {
          if (controller.productsMap.isEmpty) {
            return EmptyCart();
          }
          return SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.795,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10.0),
                    itemCount: controller.productsMap.length,
                    itemBuilder: (context, index) =>
                        AnimationConfiguration.staggeredList(
                      position: index,
                      delay: const Duration(milliseconds: 100),
                      child: SlideAnimation(
                        duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        verticalOffset: -250,
                        child: ScaleAnimation(
                          duration: const Duration(milliseconds: 1500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: CartProductsCard(
                            products: controller.productsMap.keys.toList()[index],
                            quantity: controller.productsMap.values.toList()[index],
                            index: index,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: CartTotal(),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
