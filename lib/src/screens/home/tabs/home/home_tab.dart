import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app_components/app_components.dart';
import '../../../../colors.dart';
import '../../../../size_setup.dart';
import '../../../notification/notification_screen.dart';
import '../../../splash/splash_screen.dart';
import '../../components/categories.dart';
import '../../components/cloth_sale.dart';
import '../../components/cloth_types.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Padding(
      padding: EdgeInsets.all(rSize * 2),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Your location'),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          height: rSize * 2,
                          colorFilter: const ColorFilter.mode(
                              AppColors.kLightPrimary, BlendMode.srcIn),
                        ),
                        const Text(
                          ' Abuja, Nigeria',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(SplashScreen.routeName);
                          },
                          icon: Icon(
                            Icons.arrow_drop_down,
                            size: rSize * 3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(NotificationScreen.routeName);
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            AppColors.kTertiaryColor.withOpacity(0.3),
                        child: SvgPicture.asset(
                          'assets/icons/bell.svg',
                          colorFilter: const ColorFilter.mode(
                              AppColors.kLightPrimary, BlendMode.srcIn),
                          height: rSize * 2.5,
                        ),
                      ),
                    ),
                    Positioned(
                      top: rSize,
                      right: rSize,
                      child: Container(
                        height: rSize * 0.7,
                        width: rSize * 0.7,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: rSize * 2),
            //const PromoInfo(),
            const SectionHeader('Category'),
            const ClothTypes(),
            // SizedBox(height: rSize * 2),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Flash Sale',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: rSize * 1.8,
            //       ),
            //     ),
            //     const Row(
            //       children: [
            //         Text('Closing in: '),
            //         TimeCard(' 02 '),
            //         Text(' : '),
            //         TimeCard(' 12 '),
            //         Text(' : '),
            //         TimeCard(' 56 '),
            //       ],
            //     ),
            //   ],
            // ),
            SizedBox(height: rSize * 2),
            const Categories(),
            SizedBox(height: rSize * 2),
            const ClothSale(),
          ],
        ),
      ),
    );
  }
}
