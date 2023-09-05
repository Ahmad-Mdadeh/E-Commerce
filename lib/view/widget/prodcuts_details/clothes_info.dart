import 'package:e_commerce/logic/controllers/products_controller.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productsId;
  final rate;
  final String description;

  const ClothesInfo({
    required this.title,
    required this.productsId,
    required this.rate,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductsController>();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextUtils(
                  textOverflow: TextOverflow.ellipsis,
                  text: title,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Obx(() {
                return InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    controller.manageFavorites(productsId);
                  },
                  child: AnimatedContainer(
                    height: 40,
                    width: 40,
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Get.isDarkMode
                              ? Colors.white.withOpacity(
                                  controller.isFavorites(productsId)
                                      ? 0.2
                                      : 0.0)
                              : Colors.black.withOpacity(
                                  controller.isFavorites(productsId)
                                      ? 0.2
                                      : 0.0),
                          blurRadius: 20,
                          offset: Offset(5, 10),
                        ),
                      ],
                      color: Get.isDarkMode
                          ? controller.isFavorites(productsId)
                              ? Colors.white
                              : Colors.white.withOpacity(0.2)
                          : controller.isFavorites(productsId)
                              ? Colors.white
                              : Colors.black.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: controller.isFavorites(productsId)
                          ? Colors.red
                          : Colors.grey,
                      size: 25,
                    ),
                  ),
                );
              }),
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: '$rate',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
              const SizedBox(
                width: 8.0,
              ),
              RatingBar.builder(
                initialRating: rate,
                ignoreGestures: true,
                minRating: 0,
                itemSize: 20.0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          ReadMoreText(
            description,
            textAlign: TextAlign.justify,
            trimLines: 2 ,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show Less',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
              height: 2.0,
              fontSize: 16.0,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
