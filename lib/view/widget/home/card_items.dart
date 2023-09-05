import 'package:e_commerce/logic/controllers/cart_controller.dart';
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

class  CardItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        if (controller.searchList.isEmpty) {
          return Expanded(
            child: controller.searchController.text.isNotEmpty
                ? Get.isDarkMode
                    ? Image.asset('assets/images/search_empty_dark.png')
                    : Image.asset('assets/images/search_empry_light.png')
                : AnimationLimiter(
                    child: GridView.count(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: 0.59,
                      crossAxisCount: 2,
                      children: List.generate(
                        controller.productsList.length,
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
                              child: buildCardItems(
                                image: controller.productsList[index].image,
                                price: controller.productsList[index].price,
                                rating:
                                    controller.productsList[index].rating.rate,
                                productsId: controller.productsList[index].id,
                                products: controller.productsList[index],
                                isHighlighted: true.obs,
                                onTap: () => Get.to(
                                  ProductsDetails(
                                    products: controller.productsList[index],
                                    title: controller.productsList[index].title,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          );
        } else {
          return Expanded(
            child: AnimationLimiter(
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 0.59,
                crossAxisCount: 2,
                children: List.generate(
                  controller.searchList.length,
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
                        child: buildCardItems(
                          image: controller.searchList[index].image,
                          price: controller.searchList[index].price,
                          rating: controller.searchList[index].rating.rate,
                          productsId: controller.searchList[index].id,
                          products: controller.searchList[index],
                          isHighlighted: true.obs,
                          onTap: () => Get.to(
                            ProductsDetails(
                              products: controller.searchList[index],
                              title: controller.searchList[index].title,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      }
    });
  }

  Widget buildCardItems({
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
                            )
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
