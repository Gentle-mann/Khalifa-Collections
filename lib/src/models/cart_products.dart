import 'dart:convert';

List<GetCart> getCartFromJson(String str) =>
    List<GetCart>.from(json.decode(str).map((x) => GetCart.fromJson(x)));

class GetCart {
  List<CartProduct> products;

  GetCart({
    required this.products,
  });

  factory GetCart.fromJson(Map<String, dynamic> json) => GetCart(
        products: List<CartProduct>.from(
            json["products"].map((x) => CartProduct.fromJson(x))),
      );
}

class CartProduct {
  ProductItem cartItem;
  int quantity;
  String id;

  CartProduct({
    required this.cartItem,
    required this.quantity,
    required this.id,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        cartItem: ProductItem.fromJson(json["cartItem"]),
        quantity: json["quantity"],
        id: json["_id"],
      );
}

class ProductItem {
  String id;
  String name;
  String category;
  List<String> imageUrl;
  String price;

  ProductItem({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        price: json["price"],
      );
}
