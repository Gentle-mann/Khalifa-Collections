import 'package:flutter/material.dart';

import '../../../models/cloth_type.dart';
import 'cloth_type_card.dart';

class ClothTypes extends StatelessWidget {
  const ClothTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        ClothType.categories.length,
        (index) => ClothTypeCard(
          index,
          title: ClothType.categories[index].title,
          icon: ClothType.categories[index].icon,
        ),
      ),
    );
  }
}
