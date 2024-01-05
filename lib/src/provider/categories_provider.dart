import 'package:flutter/material.dart';
import 'package:seed/src/services/products_service.dart';

import '../models/products_model.dart';

class CategoriesProvider extends ChangeNotifier {
  String _category = '';
  int _selectedIndex = 0;
  // Future<List<Products>> _products = [];
  // Future<List<Products>> get products => _products;
  int get selectedIndex => _selectedIndex;
  void setIndex(index) {
    _selectedIndex = index;
    notifyListeners();
  }

  String get category => _category;
  void setCategory(String newCategory) {
    _category = newCategory;
    notifyListeners();
  }

  Future<List<Products>> getProducts(category) {
    Future<List<Products>> products;
    switch (category) {
      case 'All':
        products = ProductsService().getAllProducts();
        break;
      case 'Newest':
        products = ProductsService().getNewestProducts();
        break;
      case 'Most Popular':
        products = ProductsService().getAllProducts();
        break;
      case 'Affordable':
        products = ProductsService().getAffordableProducts();
        break;
      case 'Exclusive':
        products = ProductsService().getExclusiveProducts();
        break;
      case 'Men':
        products = ProductsService().getMaleProducts();

        break;
      case 'Women':
        products = ProductsService().getFemaleProducts();

        break;
      default:
        products = ProductsService().getAllProducts();
        break;
    }
    return products;
  }
}
