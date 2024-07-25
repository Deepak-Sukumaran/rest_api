import 'package:api_integration/Model/ProductModel.dart';

import 'package:http/http.dart' as http;

class HttpSercvice {
  static Future<List<ProductModel>> fetchProducts() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      var responseData = response.body;
      return productModelFromJson(responseData);
    } else {
      throw Exception();
    }
  }
}
