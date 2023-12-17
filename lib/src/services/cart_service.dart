import 'dart:convert';

import 'package:seed/src/app_cache/app_cache.dart';
import 'package:http/http.dart' as http;
import 'package:seed/src/models/add_to_cart.dart';

import '../models/cart_products.dart';
import 'config.dart';

class CartService {
  var appCache = AppCache();
  var client = http.Client();
  Future<bool> addToCart(AddToCartModel addToCartModel) async {
    final userToken = appCache.getUserToken();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $userToken',
    };
    var url = Uri.http(Config.apiUrl, Config.addCartUrl);
    var response = await http.post(
      url,
    );

    var getResponse = await http.post(
      Uri.parse(response.headers["location"]!),
      body: jsonEncode(addToCartModel.toJson()),
      headers: requestHeaders,
    );

    if (getResponse.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<CartProduct>> getCart() async {
    final userToken = appCache.getUserToken();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $userToken'
    };
    var url = Uri.http(Config.apiUrl, Config.getCartUrl);
    var response = await http.get(
      url,
      headers: requestHeaders,
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      final products = data[0]['products'];
      final cart = List<CartProduct>.from(products.map((product) {
        return CartProduct.fromJson(product);
      }));
      return cart;
    } else {
      throw Exception('Failed to get cart');
    }
  }

  Future<bool> deleteCartItem(String id) async {
    final userToken = appCache.getUserToken();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $userToken'
    };
    var url = Uri.http(Config.apiUrl, '${Config.addCartUrl}/$id');
    var response = await client.delete(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
