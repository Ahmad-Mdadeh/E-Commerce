import 'package:e_commerce/logic/controllers/products_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/home/card_items.dart';
import 'package:e_commerce/view/widget/home/search_form_text.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final controller = Get.find<ProductsController>();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? darkColor : mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtils(
                          text: 'Find Your',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                      SizedBox(
                        height: 5.0,
                      ),
                      TextUtils(
                          text: 'INSPIRATION',
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 29),
                      SizedBox(
                        height: 20.0,
                      ),
                      SearchFormText(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17.0,),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextUtils(
                    text: 'Categories',
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0,),
                ),
              ),
              SizedBox(height: 30.0),
              CardItems(),
            ],
          ),
        ),
      );
    }
  }
