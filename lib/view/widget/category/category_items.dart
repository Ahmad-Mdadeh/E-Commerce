import 'package:e_commerce/logic/controllers/cart_controller.dart';
import 'package:e_commerce/logic/controllers/categories_controller.dart';
import 'package:e_commerce/logic/controllers/products_controller.dart';
import 'package:e_commerce/model/products.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/screen/products_details.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

final controller = Get.find<ProductsController>();
final cartController = Get.find<CartController>();
final categoriesController = Get.find<CategoriesController>();

class CategoryItems extends StatelessWidget {
  final String categoryTitle;

  const CategoryItems({
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkColor : mainColor,
      ),
      body: Obx(() {
        if (categoriesController.categoryIsLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        }
        return AnimationLimiter(
          child: GridView.count(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 0.59,
            crossAxisCount: 2,
            children: List.generate(
              categoriesController.productsCategoriesList.length,
              (index) => AnimationConfiguration.staggeredGrid(
                columnCount: 100,
                position: index,
                delay: Duration(milliseconds: 150),
                child: SlideAnimation(
                  duration: Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  horizontalOffset: -300,
                  verticalOffset: -850,
                  child: FadeInAnimation(
                    child: buildCategoryItems(
                      image: categoriesController
                          .productsCategoriesList[index].image,
                      price: categoriesController
                          .productsCategoriesList[index].price,
                      rating: categoriesController
                          .productsCategoriesList[index].rating.rate,
                      productsId:
                          categoriesController.productsCategoriesList[index].id,
                      products:
                          categoriesController.productsCategoriesList[index],
                      isHighlighted: true.obs,
                      onTap: () => Get.to(
                        ProductsDetails(
                          products: categoriesController.productsCategoriesList[index],
                          title: categoriesController.productsCategoriesList[index].title,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildCategoryItems({
    required RxBool isHighlighted,
    required String image,
    required double price,
    required double rating,
    required int productsId,
    required Products products,
    required Function() onTap,
  }) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.14),
                spreadRadius: 3.0,
                blurRadius: 6.0,
              )
            ],
          ),
          child: Column(
            children: [
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        controller.manageFavorites(productsId);
                      },
                      icon: controller.isFavorites(productsId)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        cartController.addProductsToCart(products);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              }),
              Container(
                width: double.infinity,
                height: 250.0,
                child: Image(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                        text: '\$$price',
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0),
                    Container(
                      height: 20.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? Colors.pink : mainColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 3.0,
                          right: 2.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              text: '$rating',
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0,
                            ),
                            Icon(
                              Icons.star,
                              size: 13.0,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
