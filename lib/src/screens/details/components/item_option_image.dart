import 'package:flutter/material.dart';

import '../../../size_setup.dart';

class ItemOptionImage extends StatelessWidget {
  const ItemOptionImage({
    super.key,
    required this.image,
    required this.color,
  });
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Container(
      height: rSize * 5,
      width: rSize * 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rSize),
        color: color,
        border: Border.all(color: Colors.white, width: 4),
        // image: DecorationImage(
        //   fit: BoxFit.cover,
        //   image: AssetImage(
        //     image,
        //   ),
        // ),
      ),
      child: Image.asset(image),
    );
  }
}
