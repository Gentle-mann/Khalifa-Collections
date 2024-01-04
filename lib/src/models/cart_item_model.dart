// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class CartItemModel {
//   final String imageUrl;
//   final String name;
//   final String price;
//   final int cartKey;
//   final bool isSelected;
//   CartItemModel({
//     required this.imageUrl,
//     required this.name,
//     required this.price,
//     required this.cartKey,
//     required this.isSelected,
//   });

//   CartItemModel copyWith({
//     String? imageUrl,
//     String? name,
//     String? price,
//     int? cartKey,
//     bool? isSelected,
//   }) {
//     return CartItemModel(
//       imageUrl: imageUrl ?? this.imageUrl,
//       name: name ?? this.name,
//       price: price ?? this.price,
//       cartKey: cartKey ?? this.cartKey,
//       isSelected: isSelected ?? this.isSelected,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'imageUrl': imageUrl,
//       'name': name,
//       'price': price,
//       'cartKey': cartKey,
//       'isSelected': isSelected,
//     };
//   }

//   factory CartItemModel.fromMap(Map<String, dynamic> map) {
//     return CartItemModel(
//       imageUrl: map['imageUrl'] as String,
//       name: map['name'] as String,
//       price: map['price'] as String,
//       cartKey: map['cartKey'] as int,
//       isSelected: map['isSelected'] as bool,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CartItemModel.fromJson(String source) =>
//       CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'CartItemModel(imageUrl: $imageUrl, name: $name, price: $price, cartKey: $cartKey, isSelected: $isSelected)';
//   }

//   @override
//   bool operator ==(covariant CartItemModel other) {
//     if (identical(this, other)) return true;

//     return other.imageUrl == imageUrl &&
//         other.name == name &&
//         other.price == price &&
//         other.cartKey == cartKey &&
//         other.isSelected == isSelected;
//   }

//   @override
//   int get hashCode {
//     return imageUrl.hashCode ^
//         name.hashCode ^
//         price.hashCode ^
//         cartKey.hashCode ^
//         isSelected.hashCode;
//   }
// }
