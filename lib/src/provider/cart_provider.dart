import 'package:flutter/foundation.dart';
import 'package:seed/src/services/cart_service.dart';

import '../models/add_to_cart.dart';
import '../models/cart_products.dart';

class CartProvider extends ChangeNotifier {
  final List<String> _ids = [];
  int _counter = 0;
  int get counter => _counter;
  List<CartProduct> _cart = [];
  List<CartProduct> get cart {
    return _cart;
  }

  List<String> get ids {
    return _ids;
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

  Future<bool> createCart(AddToCartModel addToCartModel) async {
    notifyListeners();
    return CartService().addToCart(addToCartModel);
  }

  Future<List<CartProduct>> getCart() async {
    // final cartData = _cartBox.keys.map((key) {
    //   final item = _cartBox.get(key);
    //   return {
    //     "key": key,
    //     "id": item["id"],
    //     "category": item["category"],
    //     "subCategory": item["subCategory"],
    //     "subSubCategory": item["subSubCategory"],
    //     "name": item["name"],
    //     "imageUrl": item["imageUrl"],
    //     "price": item["price"],
    //     "quantity": item["quantity"],
    //     "sizes": item["sizes"],
    //     "colors": item["colors"],
    //     "isSelected": item["isSelected"]
    //   };
    // }).toList();

    // _cart = cartData.reversed.toList();
    /// _cart = await CartService().getCart();
    _cart = await CartService().getCart();

    return CartService().getCart();
  }

  Future<void> deleteCart(String id) async {
    await CartService().deleteCartItem(id);
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

  List<CartProduct> findCartById(List<String> cartIds) {
    return _cart.where((element) => cartIds.contains(element.id)).toList();
  }
}
