import 'package:e_commerce/model/products.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt quantityOnly = 0.obs;
  var productsMap = {}.obs;


  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  get productsSupTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  void addProductsToCart(Products products) {
    if (productsMap.containsKey(products)) {
      productsMap[products] += 1;
    } else {
      productsMap[products] = 1;
      Get.snackbar(
        'Add Successful to Cart :',
        products.title,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  void removeProductsFromCart(Products products) {
    if (productsMap.containsKey(products) && productsMap[products] == 1) {
      productsMap.removeWhere((key, value) => key == products);
    } else {
      productsMap[products] -= 1;
    }
  }

  void removeOneProductsFromCart(Products products) {
    productsMap.removeWhere((key, value) => key == products);
  }

  void clearAllProductsFromCart() {
    productsMap.clear();
  }

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}