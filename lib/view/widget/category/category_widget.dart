import 'package:e_commerce/logic/controllers/categories_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/category/category_items.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

CategoriesController categoriesController = Get.find<CategoriesController>();

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Obx(() {
      if (categoriesController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      }
      return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 20.0),
        itemCount: categoriesController.categoriesList.length,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          delay: const Duration(milliseconds: 100),
          child: SlideAnimation(
            duration: const Duration(milliseconds: 2500),
            curve: Curves.fastLinearToSlowEaseIn,
            verticalOffset: -250,
            child: ScaleAnimation(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.fastLinearToSlowEaseIn,
              child: InkWell(
                onTap: () {
                  Get.to(
                    () => CategoryItems(categoryTitle: categoriesController.categoriesList[index],  ),
                  );
                  categoriesController.getCategoryIndex(index);
                },
                child: Container(
                  height: 150.0,
                  width: double.infinity,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          categoriesController.imageCategories[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: TextUtils(
                        backgroundColor: Colors.black38,
                        text: categoriesController.categoriesList[index],
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }
}
