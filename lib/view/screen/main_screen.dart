import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:e_commerce/logic/controllers/cart_controller.dart';
import 'package:e_commerce/logic/controllers/main_controller.dart';
import 'package:e_commerce/navigation/custom_animated_bottom_bar.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

MainController controller = Get.find();
CartController cartController = Get.find();

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Get.isDarkMode ? darkColor : mainColor,
          leading: Container(),
          actions: [
            Obx(() {
              return badges.Badge(
                position: BadgePosition.topEnd(top: 1, end: 0),
                badgeAnimation: BadgeAnimation.scale(
                  animationDuration: const Duration(milliseconds: 300),
                ),
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.cartScreen);
                  },
                  icon: Image.asset("assets/images/shop.png"),
                ),
              );
            }),
          ],
          centerTitle: true,
          title: Text(
            controller.title[controller.curIndex.value],
          ),
        ),
        bottomNavigationBar: CustomAnimatedBottomBar(
          containerHeight: 55,
          backgroundColor: Get.isDarkMode ? darkColor : Colors.white,
          selectedIndex: controller.curIndex.value,
          showElevation: false,
          curve: Curves.fastOutSlowIn,
          onItemSelected: controller.curIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.storefront),
              title: Text('Home'),
              activeColor: Get.isDarkMode ? pinkClr : mainColor,
              inactiveColor: Get.isDarkMode ? Colors.grey : Colors.black87,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
              activeColor: Get.isDarkMode ? pinkClr : mainColor,
              inactiveColor: Get.isDarkMode ? Colors.grey : Colors.black87,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorite'),
              activeColor: Get.isDarkMode ? pinkClr : mainColor,
              inactiveColor: Get.isDarkMode ? Colors.grey : Colors.black87,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Get.isDarkMode ? pinkClr : mainColor,
              inactiveColor: Get.isDarkMode ? Colors.grey : Colors.black87,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        body: IndexedStack(
          index: controller.curIndex.value,
          children: controller.tabs,
        ),
      );
    });
  }
}
