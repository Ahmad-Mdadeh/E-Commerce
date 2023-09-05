import 'package:e_commerce/logic/controllers/cart_controller.dart';
import 'package:e_commerce/logic/controllers/categories_controller.dart';
import 'package:e_commerce/logic/controllers/products_controller.dart';
import 'package:get/get.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductsController>(ProductsController());
    Get.put<CategoriesController>(CategoriesController());
    Get.lazyPut(() => CartController());
  }

}