import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:seed/src/app_cache/app_cache.dart';

class WishlistProvider extends ChangeNotifier {
  final _appCache = AppCache();

  List<dynamic> _favorites = [];
  List<dynamic> _fav = [];
  List<dynamic> _ids = [];
  List<dynamic> get ids {
    return _ids;
  }

  Future<void> initializeApp() async {
    _ids = await _appCache.getFavIds();
    print('_ids: $_ids');
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
    final _favBox = Hive.box('favb');
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item["id"],
      };
    }).toList();
    _favorites = favData.toList();
    //_ids = ;
    setIds(_favorites.map((item) => item["id"].toString()).toList());
    return _favorites;
  }

  Future<void> createFav(Map<String, dynamic> addFav) async {
    final _favBox = Hive.box('favb');
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
    final _favBox = Hive.box('favb');
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

    return _fav;
  }

  Future<void> removeFav(int key) async {
    final favBox = Hive.box('favb');
    await favBox.delete(key);
    notifyListeners();
  }
}
