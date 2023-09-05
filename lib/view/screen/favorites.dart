import 'package:e_commerce/logic/controllers/products_controller.dart';
import 'package:e_commerce/model/products.dart';
import 'package:e_commerce/view/screen/products_details.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

ProductsController controller = Get.find<ProductsController>();

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favoritesList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset('assets/images/heart.png'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextUtils(
                  text: 'Please, Add your favorites products',
                  color: Get.isDarkMode ? Colors.grey : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                )
              ],
            ),
          );
        }
        return AnimationLimiter(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: controller.favoritesList.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                delay: const Duration(milliseconds: 100),
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  verticalOffset: -250,
                  child: ScaleAnimation(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: buildFavItems(
                      isHighlighted: true.obs,
                      image: controller.favoritesList[index].image,
                      title: controller.favoritesList[index].title,
                      price: controller.favoritesList[index].price,
                      productsId: controller.favoritesList[index].id,
                      products: controller.favoritesList[index],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }

  Widget buildFavItems({
    required RxBool isHighlighted,
    required String image,
    required String title,
    required double price,
    required int productsId,
    required Products products,
  }) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: InkWell(
                onTap: () {
                  Get.to(
                    ProductsDetails(
                      products: products,
                      title: title,
                    ),
                  );
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: title,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextUtils(
                    text: 'Price: \$${price}',
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHighlightChanged: (value) {
                isHighlighted(!(isHighlighted.value));
              },
              onTap: () {
                controller.manageFavorites(productsId);
              },
              child: Obx(() {
                return AnimatedContainer(
                  margin: EdgeInsets.all(isHighlighted.value ? 0 : 3),
                  height: isHighlighted.value ? 45 : 32,
                  width: isHighlighted.value ? 45 : 32,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Get.isDarkMode
                            ? Colors.white70
                            : Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: Offset(1, 2),
                      ),
                    ],
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.delete,
                    color: Colors.pink.withOpacity(1.0),
                    size: 30,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
