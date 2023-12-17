import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    required this.id,
    required this.name,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.sizes,
    required this.description,
    required this.subCategory,
    required this.subSubCategory,
    required this.updatedAt,
  });
  late final String id;
  late final String name;
  late final String title;
  late final String category;
  late final List<String> imageUrl;
  late final String price;
  late final List<Sizes> sizes;
  late final String description;
  late final String subCategory;
  late final String subSubCategory;
  late final String updatedAt;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    title = json['title'];
    category = json['category'];
    imageUrl = List.castFrom<dynamic, String>(json['imageUrl']);
    price = json['price'];
    sizes = List.from(json['sizes']).map((e) => Sizes.fromJson(e)).toList();
    description = json['description'];
    subCategory = json['subCategory'];
    subSubCategory = json['subSubCategory'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['title'] = title;
    _data['category'] = category;
    _data['imageUrl'] = imageUrl;
    _data['price'] = price;
    _data['sizes'] = sizes.map((e) => e.toJson()).toList();
    _data['description'] = description;
    _data['subCategory'] = subCategory;
    _data['subSubCategory'] = subSubCategory;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Sizes {
  Sizes({
    required this.size,
    required this.isSelected,
    required this.id,
  });
  late final String size;
  late final bool isSelected;
  late final String id;

  Sizes.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    isSelected = json['isSelected'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['size'] = size;
    _data['isSelected'] = isSelected;
    _data['_id'] = id;
    return _data;
  }
}
