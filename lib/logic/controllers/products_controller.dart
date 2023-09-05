import 'package:e_commerce/model/products.dart';
import 'package:e_commerce/services/products_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductsController extends GetxController {
  ProductsServices productsServices = ProductsServices();
  var productsList = <Products>[].obs;
  var favoritesList = <Products>[].obs;
  RxBool isLoading = true.obs;
  RxBool get = true.obs;
  var storage = GetStorage();

  //search
  var searchList = <Products>[].obs;

    TextEditingController searchController = TextEditingController();

  void onInit() {
    super.onInit();
    getProducts();
    List? stored = storage.read<List>('isFavoritesList');
    if (stored != null) {
      favoritesList = stored.map((e) => Products.fromJson(e)).toList().obs;
    }
  }

  Future getProducts() async {
    var products = await productsServices.getProducts();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productsList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  manageFavorites(int productsId) async {
    var index = favoritesList.indexWhere((element) => element.id == productsId);
    if (index >= 0) {
      favoritesList.removeAt(index);
      await storage.remove('isFavoritesList');
    } else {
      favoritesList.add(productsList.firstWhere((element) => element.id == productsId));
      storage.write('isFavoritesList', favoritesList);
    }
  }

  bool isFavorites(int productsId) {
    return favoritesList.any((element) => element.id == productsId);
  }

  //search
  void addSearchToList(String value) {
    var valueLower = value.toLowerCase();
    searchList.value = productsList.where(
      (search) {
        var searchTitle = search.title.toLowerCase();
        var searchPrice = search.price.toString().toLowerCase();
        return searchTitle.contains(valueLower) ||
            searchPrice.contains(valueLower);
      },
    ).toList();
    update();
  }

  void clearSearch() {
    searchController.clear();
    addSearchToList('');
  }
}
