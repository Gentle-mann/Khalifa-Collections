import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_setup.dart';

class AddToCartCard extends StatelessWidget {
  const AddToCartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(rSize),
          topRight: Radius.circular(rSize),
        ),
      ),
      child: Row(
        children: [
          const Column(
            children: [
              Text('Total price'),
              Text('\$83.97'),
            ],
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/bag_filled.svg'),
                  const Text('Add to Cart'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
