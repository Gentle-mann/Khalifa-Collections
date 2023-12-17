import 'package:flutter/material.dart';
import 'package:seed/src/app_cache/app_cache.dart';

class WishlistProvider extends ChangeNotifier {
  final _favBox = AppCache().getFavBox();

  List<dynamic> _favorites = [];
  List<dynamic> _fav = [];
  List<dynamic> _ids = [];
  List<dynamic> get ids {
    return _ids;
  }

  set ids(List<dynamic> newIds) {
    _ids = newIds;
    notifyListeners();
  }

  List<dynamic> get favorites => _favorites;
  set favorites(List<dynamic> newFav) {
    _favorites = newFav;
    notifyListeners();
  }

  getFavorites() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item["id"],
      };
    }).toList();
    _favorites = favData.toList();
    _ids = _favorites.map((item) => item["id"]).toList();
    return _favorites;
  }

  Future<void> createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
    getFavorites();
    notifyListeners();
  }

  List<dynamic> get fav => _fav;
  set fav(List<dynamic> newFav) {
    _fav = newFav;
    notifyListeners();
  }

  List<dynamic> getAllData() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item["id"],
        "name": item["name"],
        // "title": item["title"],
        "category": item["category"],
        "subCategory": item["subCategory"],
        "subSubCategory": item["subSubCategory"],
        "price": item["price"],
        "imageUrl": item["imageUrl"],
      };
    }).toList();
    _fav = favData.reversed.toList();
    notifyListeners();
    return _fav;
  }

  Future<void> removeFav(int key) async {
    await _favBox.delete(key);
    notifyListeners();
  }
}
