import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/point.svg'),
        const Expanded(
          child: Text('Use my current location'),
        ),
      ],
    );
  }
}
