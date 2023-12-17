import 'package:flutter/material.dart';

class PriceCalcRow extends StatelessWidget {
  const PriceCalcRow({
    super.key,
    required this.item,
    required this.price,
  });
  final String item;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(item, style: const TextStyle(fontSize: 15)),
        Text(
          price,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
