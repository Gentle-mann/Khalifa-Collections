import 'dart:convert';

import 'package:seed/src/app_cache/app_cache.dart';
import 'package:http/http.dart' as https;
import 'package:seed/src/models/add_to_cart.dart';

import '../models/cart_products.dart';
import 'config.dart';

class CartService {
  var appCache = AppCache();
  var client = https.Client();

  Future<bool> addToCart(AddToCartModel addToCartModel) async {
    final userToken = await appCache.getUserToken();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $userToken',
    };
    var url = Uri.https(Config.apiUrl, Config.addCartUrl);
    var response = await client.post(
      url,
      body: jsonEncode(addToCartModel.toJson()),
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<CartProduct>> getCart() async {
    final userToken = await appCache.getUserToken();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $userToken'
    };
    var url = Uri.https(Config.apiUrl, Config.getCartUrl);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      final products = data[0]['products'];
      final cart = List<CartProduct>.from(products.map((product) {
        return CartProduct.fromJson(product);
      }));
      return cart.reversed.toList();
    } else {
      throw Exception('Failed to get cart');
    }
  }

  Future<void> deleteCartItem(String id) async {
    final userToken = await appCache.getUserToken();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $userToken'
    };
    var url = Uri.https(Config.apiUrl, '${Config.addCartUrl}/$id');
    await client.delete(url, headers: requestHeaders);
  }
}
