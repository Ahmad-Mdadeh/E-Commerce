import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/logic/controllers/cart_controller.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/prodcuts_details/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

CartController cartController = Get.find();

class ImageSliders extends StatelessWidget {
  final String imageUrl;

  const ImageSliders({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    RxInt currentIndex = 0.obs;
    RxInt currentColor = 0.obs;
    List<Color> colorSelected = [
      darkColor,
      kColor1,
      kColor2,
      kColor3,
      kColor4,
      kColor5,
      darkSettings,
      accountSettings,
      notSettings,
      languageSettings,
    ];
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, res) {
              currentIndex.value = index;
            },
            height: 500.0,
            autoPlay: true,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(seconds: 1),
          ),
        ),
        Obx(() {
          return Positioned(
            bottom: 0.0,
            left: 180.0,
            child: AnimatedSmoothIndicator(
              activeIndex: currentIndex.value,
              count: 3,
              effect: ExpandingDotsEffect(
                dotColor: Get.isDarkMode ? Colors.grey : Colors.black,
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
              ),
            ),
          );
        }),
        Positioned(
          bottom: 30.0,
          right: 30.0,
          child: Container(
            height: 200.0,
            width: 50.0,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: ListView.separated(
                itemBuilder: (context, index) => Obx(() {
                      return GestureDetector(
                        onTap: () {
                          currentColor.value = index;
                        },
                        child: ColorPicker(
                          color: colorSelected[index],
                          outerBorder: currentColor == index,
                        ),
                      );
                    }),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 3.0,
                    ),
                itemCount: colorSelected.length),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              left: 25.0,
              right: 25.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  return badges.Badge(
                    badgeAnimation: BadgeAnimation.scale(
                      animationDuration: const Duration(milliseconds: 300),
                    ),
                    position: BadgePosition.topEnd(top: -10, end: -10),
                    badgeContent: Text(
                      cartController.quantity().toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? pinkClr.withOpacity(0.8)
                              : mainColor.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
