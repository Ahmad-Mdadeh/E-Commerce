import 'package:e_commerce/logic/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget {
  final controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(builder: (_) {
      return TextField(
        style: TextStyle(
          color: Colors.black,
        ),
        controller: controller.searchController,
        onChanged: (value) {
          controller.addSearchToList(value);
        },
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.red,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: controller.searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.clearSearch();
                  },
                  icon: Icon(Icons.close),
                  color: Colors.black,
                )
              : null,
          hintText: "Search you're looking for",
          hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
    });
  }
}
