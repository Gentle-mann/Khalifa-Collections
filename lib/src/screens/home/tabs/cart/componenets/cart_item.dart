// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/models/cart_products.dart';

import 'package:seed/src/provider/cart_provider.dart';

import '../../../../../app_components/item_image_card.dart';
import '../../../../../size_setup.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    required this.cartItem,
    required this.cartDeleteId,
    this.shouldDelete = true,
  });
  final ProductItem cartItem;
  final String cartDeleteId;
  final bool shouldDelete;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Container(
      margin: EdgeInsets.only(bottom: rSize),
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          ItemImageCard(imageUrl: widget.cartItem.imageUrl[0]),
          SizedBox(width: rSize),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: SizeSetup.width! * 0.4,
                      child: Text(
                        widget.cartItem.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '₦${widget.cartItem.price}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                if (widget.shouldDelete)
                  Consumer<CartProvider>(
                      builder: (context, cartProvider, child) {
                    return IconButton(
                      onPressed: () {
                        cartProvider.deleteCart(widget.cartDeleteId);
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    );
                  })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
