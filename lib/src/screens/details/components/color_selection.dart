import 'package:flutter/material.dart';

import '../../../size_setup.dart';

class ColorSelectionCard extends StatelessWidget {
  const ColorSelectionCard({
    super.key,
    this.isSelected = false,
    required this.color,
  });

  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Container(
      height: rSize * 2.5,
      width: rSize * 2.5,
      padding: EdgeInsets.all(rSize * 0.7),
      margin: EdgeInsets.all(rSize),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: isSelected
          ? Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
