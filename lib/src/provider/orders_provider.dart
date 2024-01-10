import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class OrdersProvider extends ChangeNotifier {
  final _ordersBox = Hive.box('orders');
  final List<String> _ids = [];
  List<Map<String, dynamic>> _orders = [];
  List<Map<String, dynamic>> get orders => _orders;
  List<String> get ids => _ids;
  Box<dynamic> get orderBox => _ordersBox;
  Future<void> initialize() async {
    getOrders();
  }

  Future<void> createOrder(List<Map<String, dynamic>> newOrder) async {
    for (var i = 0; i < newOrder.length; i++) {
      if (!_ids.contains(newOrder[i]["id"])) {
        await _ordersBox.add(newOrder[i]);
        _ids.add(newOrder[i]["id"]);
      }

      getOrders();
    }

    notifyListeners();
  }

  void setOrders(List<Map<String, dynamic>> newOrders) {
    _orders = newOrders;
    notifyListeners();
  }

  void getOrders() {
    final ordersData = _ordersBox.keys.map((key) {
      final item = _ordersBox.get(key);
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

    _orders = ordersData.reversed.toList();
    notifyListeners();
  }

  Future<void> deleteOrder(int key, String id) async {
    await _ordersBox.delete(key);

    _ids.removeWhere((element) => element == id);
    getOrders();
    notifyListeners();
  }
}
