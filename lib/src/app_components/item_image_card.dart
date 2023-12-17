import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../size_setup.dart';

class ItemImageCard extends StatelessWidget {
  const ItemImageCard({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Container(
      height: rSize * 8,
      width: rSize * 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rSize),
        color: Colors.white,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
      ),
    );
  }
}
