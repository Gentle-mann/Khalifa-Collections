import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/core/responsive/responsive.dart';
import 'package:seed/src/core/utils/snackbar.dart';
import 'package:seed/src/provider/launch_link_provider.dart';

import '../../../../app_components/app_components.dart';
import '../../../../colors.dart';
import '../../../../size_setup.dart';
import '../../components/categories.dart';
import '../../components/cloth_sale.dart';
import '../../components/cloth_types.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key,
  });

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
                        const SizedBox(width: 10),
                        const Text(
                          'Nigeria',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Stack(
                //   children: [
                //     GestureDetector(
                //       onTap: () {},
                //       child: CircleAvatar(
                //         backgroundColor:
                //             AppColors.kTertiaryColor.withOpacity(0.3),
                //         child: SvgPicture.asset(
                //           'assets/icons/bell.svg',
                //           colorFilter: const ColorFilter.mode(
                //               AppColors.kLightPrimary, BlendMode.srcIn),
                //           height: rSize * 2.5,
                //         ),
                //       ),
                //     ),
                //     Positioned(
                //       top: rSize,
                //       right: rSize,
                //       child: Container(
                //         height: rSize * 0.7,
                //         width: rSize * 0.7,
                //         decoration: const BoxDecoration(
                //           shape: BoxShape.circle,
                //           color: Colors.red,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
            SizedBox(height: rSize),
            Responsive(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: rSize,
                  vertical: rSize,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(rSize * 2),
                  color: AppColors.kLightPrimary,
                ),
                width: double.infinity,
                child: Center(
                  child: SelectableText(
                    'Call or WhatsApp to order quickly: 09033696162',
                    style: TextStyle(color: Colors.white),
                    onTap: () {
                      Provider.of<LaunchLinkProvider>(context, listen: false)
                          .shareOrderToWhatsApp(
                              'Hey Khalifa Collections. I would like to order:',
                              showSnackBar);
                    },
                  ),
                ),
              ),
            ),
            const SectionHeader('Categories'),
            const ClothTypes(),
            SizedBox(height: rSize * 2),
            const Categories(),
            SizedBox(height: rSize * 2),
            const ClothSale(),
          ],
        ),
      ),
    );
  }

  void showSnackBar() {
    ShowSnackBar.showSnackBar('Unable to connect', context);
  }
}
