import 'package:e_commerce/model/categories.dart';
import 'package:e_commerce/model/products.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:http/http.dart' as http;

class CategoriesServices {
  var url = Uri.parse(baseUrl + categories);

  Future<List<String>> getCategories() async {
    var response = await http.get(
      url,
      headers: {},
    );
    if (response.statusCode == 200) {
      var getCategories = categoriesFromJson(response.body);
      return getCategories;
    } else {
      return throw Exception('==========Failed to load products==========');
    }
    }
  }

  class SpecificCategoryServices {
  Future<List<Products>> getSpecificCategories(String categoryName) async {
    var url = Uri.parse(baseUrl + specificCategory + '${categoryName}');
    var response = await http.get(
      url,
      headers: {},
    );
    if (response.statusCode == 200) {
      var products = productsFromJson(response.body);
      return products;
    } else {
      return throw Exception('==========Failed to load products==========');
    }
  }
}
