import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../models/cart_products.dart';

class CartProvider extends ChangeNotifier {
  final _cartBox = Hive.box('cart');
  List<String> _ids = [];
  int _counter = 0;
  int get counter => _counter;
  List<dynamic> _cart = [];
  List<dynamic> get cart {
    return _cart;
  }

  get ids {
    return _ids;
  }

  set cart(List<dynamic> newCart) {
    _cart = newCart;
    notifyListeners();
  }

  Box<dynamic> get cartBox {
    return _cartBox;
  }

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter >= 1) {
      _counter--;
      notifyListeners();
    }
  }

  Future<void> createCart(Map<String, dynamic> newCart) async {
    if (_ids.contains(newCart["id"])) {
    } else {
      await _cartBox.add(newCart);
      _ids.add(newCart["id"]);
    }

    notifyListeners();
  }

  getCart() {
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);
      return {
        "key": key,
        "id": item["id"],
        "category": item["category"],
        "subCategory": item["subCategory"],
        "subSubCategory": item["subSubCategory"],
        "name": item["name"],
        "imageUrl": item["imageUrl"],
        "price": item["price"],
        "quantity": item["quantity"],
        "sizes": item["sizes"],
        "colors": item["colors"],
      };
    }).toList();

    _cart = cartData.reversed.toList();
  }

  Future<void> deleteCart(int key) async {
    await _cartBox.delete(key);
    _ids.removeWhere((element) => _ids.indexOf(element) == key);
    getCart();
    notifyListeners();
  }

  int? _productIndex;
  int get productIndex {
    return _productIndex ?? 0;
  }

  set setProductIndex(int newState) {
    _productIndex = newState;
    notifyListeners();
  }

  List<CartProduct> _checkout = [];
  List<CartProduct> get checkout {
    return _checkout;
  }

  set setCheckoutList(List<CartProduct> newState) {
    _checkout = newState;
    notifyListeners();
  }
}
