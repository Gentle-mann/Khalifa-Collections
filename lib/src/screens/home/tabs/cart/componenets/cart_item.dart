import 'package:flutter/material.dart';

import '../../../../../app_components/item_image_card.dart';
import '../../../../../size_setup.dart';
import 'operator_card.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });
  final String imageUrl;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          ItemImageCard(imageUrl: imageUrl),
          SizedBox(width: rSize),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text('Size: XL'),
                    Text(
                      price,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const OperatorCard(
                      '-',
                      isPlus: false,
                    ),
                    SizedBox(width: rSize),
                    const Text('1'),
                    SizedBox(width: rSize),
                    const OperatorCard(
                      '+',
                      isPlus: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
