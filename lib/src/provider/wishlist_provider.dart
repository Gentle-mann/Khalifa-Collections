import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:seed/src/app_cache/app_cache.dart';

class WishlistProvider extends ChangeNotifier {
  final _appCache = AppCache();
  final favBox = Hive.box('favc');
  List<dynamic> _favorites = [];
  List<dynamic> _fav = [];
  List<dynamic> _ids = [];
  List<dynamic> get ids {
    return _ids;
  }

  Future<void> initializeApp() async {
    _ids = await _appCache.getFavIds();
    notifyListeners();
  }

  void setIds(List<String> newIds) async {
    _ids = newIds;
    _appCache.setFavIds(newIds);
    notifyListeners();
  }

  List<dynamic> get favorites => _favorites;
  set favorites(List<dynamic> newFav) {
    _favorites = newFav;

    notifyListeners();
  }

  getFavorites() {
    final favData = favBox.keys.map((key) {
      final item = favBox.get(key);
      return {
        "key": key,
        "id": item["id"],
      };
    }).toList();
    _favorites = favData.toList();
    //_ids = ;
    setIds(_favorites.map((item) => item["id"].toString()).toList());
    notifyListeners();
    return _favorites;
  }

  Future<void> createFav(Map<String, dynamic> addFav) async {
    await favBox.add(addFav);
    getFavorites();
    notifyListeners();
  }

  List<dynamic> get fav => _fav;
  set fav(List<dynamic> newFav) {
    _fav = newFav;

    notifyListeners();
  }

  List<dynamic> getAllData() {
    final favData = favBox.keys.map((key) {
      final item = favBox.get(key);
      return {
        "key": key,
        "id": item["id"],
        "name": item["name"],
        "title": item["title"],
        "category": item["category"],
        "subCategory": item["subCategory"],
        "subSubCategory": item["subSubCategory"],
        "price": item["price"],
        "imageUrl": item["imageUrl"],
        "description": item["description"]
      };
    }).toList();
    _fav = favData.reversed.toList();

    return _fav;
  }

  Future<void> removeFav(int key) async {
    await favBox.delete(key);
    notifyListeners();
  }
}
