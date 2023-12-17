import 'dart:convert';

String addToCartToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
  String cartItem;
  int quantity;

  AddToCartModel({
    required this.cartItem,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
        "cartItem": cartItem,
        "quantity": quantity,
      };
}
