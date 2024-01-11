import 'package:flutter/material.dart';

import '../../../size_setup.dart';

class WelcomeImages extends StatelessWidget {
  const WelcomeImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return SizedBox(
      height: SizeSetup.height! * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(rSize * 10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/man_w_coat.jpeg',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: rSize),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(rSize * 10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/lady_w_coat.jpeg',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
