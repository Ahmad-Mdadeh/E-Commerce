import 'package:e_commerce/model/products.dart';
import 'package:e_commerce/utils/theme.dart';
import 'package:e_commerce/view/widget/prodcuts_details/add_cart.dart';
import 'package:e_commerce/view/widget/prodcuts_details/clothes_info.dart';
import 'package:e_commerce/view/widget/prodcuts_details/image_sliders.dart';
import 'package:e_commerce/view/widget/prodcuts_details/size_list.dart';
import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsDetails extends StatelessWidget {
  final Products products;
  final String title;

  const ProductsDetails({
    required this.products,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        actions: [
          Icon(null),
        ],
        backgroundColor: Get.isDarkMode ? darkColor : mainColor,
        centerTitle: true,
        title: TextUtils(
          textOverflow: TextOverflow.ellipsis,
          text: '${title}',
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
        leading: Icon(null),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSliders(
              imageUrl: products.image,
            ),
            ClothesInfo(
              title: products.title,
              productsId: products.id,
              rate: products.rating.rate,
              description: products.description,
            ),
            SizeList(),
            AddCart(
              price: products.price,
              products: products,
            ),
          ],
        ),
      ),
    );
  }
}
