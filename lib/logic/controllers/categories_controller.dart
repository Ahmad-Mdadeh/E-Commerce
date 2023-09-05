import 'package:e_commerce/model/products.dart';
import 'package:e_commerce/services/categories_services.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  CategoriesServices categoriesServices = CategoriesServices();
  RxBool isLoading = true.obs;
  RxBool categoryIsLoading = true.obs;
  SpecificCategoryServices specificCategoryServices =
      SpecificCategoryServices();
  var categoriesList = <String>[];
  var productsCategoriesList = <Products>[].obs;
  List<String> imageCategories = [
    'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg',
    "https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
    "https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg",
  ];

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    var categories = await categoriesServices.getCategories();
    try {
      if (categories.isNotEmpty) {
        categoriesList.addAll(categories);
      }
    } finally {
      isLoading(false);
    }
  }

  getSpecificCategories(String categoryName) async {
    categoryIsLoading(true);
    productsCategoriesList.value =
        await specificCategoryServices.getSpecificCategories(categoryName);
    categoryIsLoading(false);
  }

  void getCategoryIndex(index) async {
    var categoryIndex = await getSpecificCategories(categoriesList[index]);

    if (categoryIndex.isNotEmpty) {
      productsCategoriesList.value = categoryIndex;
    }
  }
}
