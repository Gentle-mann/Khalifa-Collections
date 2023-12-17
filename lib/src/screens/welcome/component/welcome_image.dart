import 'package:flutter/material.dart';

import '../../../size_setup.dart';

class WelcomeImages extends StatelessWidget {
  const WelcomeImages({
    super.key,
    required this.rSize,
  });

  final double rSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeSetup.height! * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 0.4,
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
          ),
          SizedBox(width: rSize),
          Expanded(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 0.75,
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
                AspectRatio(
                  aspectRatio: 0.95,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/man.jpeg',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
