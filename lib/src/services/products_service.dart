import 'package:seed/src/models/products_model.dart';
import 'package:seed/src/services/config.dart';
import 'package:http/http.dart' as http;

class ProductsService {
  static var client = http.Client();
  Future<List<Products>> getNewestProducts() async {
    var url = Uri.https(Config.apiUrl, Config.products);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final products = productsFromJson(response.body);
      return products;
    } else {
      throw Exception('Failed to get products');
    }
  }

  Future<List<Products>> getAllProducts() async {
    var url = Uri.https(Config.apiUrl, Config.products);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final products = productsFromJson(response.body);
      products.shuffle();
      return products;
    } else {
      throw Exception('Failed to get products');
    }
  }

  Future<List<Products>> getAffordableProducts() async {
    var url = Uri.https(Config.apiUrl, Config.products);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final products = productsFromJson(response.body);

      return products.where((element) {
        return double.parse(element.price.replaceAll(',', '')) < 7001;
      }).toList();
    } else {
      throw Exception('Failed to get products');
    }
  }

  Future<List<Products>> getExclusiveProducts() async {
    var url = Uri.https(Config.apiUrl, Config.products);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final products = productsFromJson(response.body);

      return products.where((element) {
        return double.parse(element.price.replaceAll(',', '')) > 7001;
      }).toList();
    } else {
      throw Exception('Failed to get products');
    }
  }

  Future<List<Products>> getMaleProducts() async {
    var url = Uri.https(Config.apiUrl, Config.products);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final products = productsFromJson(response.body);
      var maleProducts = products.where((element) =>
          element.category == 'Men' || element.category == 'Unisex');
      return maleProducts.toList();
    } else {
      throw Exception('Failed to get products');
    }
  }

  Future<List<Products>> getFemaleProducts() async {
    var url = Uri.https(Config.apiUrl, Config.products);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final products = productsFromJson(response.body);
      var maleProducts =
          products.where((element) => element.category == 'Women');
      return maleProducts.toList();
    } else {
      throw Exception('Failed to get products');
    }
  }

  Future<List<Products>> searchProducts(String searchQuery) async {
    var url = Uri.https(Config.apiUrl, '${Config.search}$searchQuery');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final results = productsFromJson(response.body);
      return results;
    } else {
      throw Exception('Failed to get the products list');
    }
  }
}
