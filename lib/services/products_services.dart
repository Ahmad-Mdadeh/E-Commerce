import 'package:e_commerce/model/products.dart';
import 'package:e_commerce/utils/my_string.dart';
import 'package:http/http.dart' as http;

class ProductsServices {
  var url = Uri.parse(baseUrl + products);

  Future<List<Products>> getProducts() async {
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
