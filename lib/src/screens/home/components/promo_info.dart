import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../models/promo.dart';
import '../../../size_setup.dart';

class PromoInfo extends StatefulWidget {
  const PromoInfo({super.key});

  @override
  State<PromoInfo> createState() => _PromoInfoState();
}

class _PromoInfoState extends State<PromoInfo> {
  int selectedIndex = 0;
  late final controller = PageController();
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return SizedBox(
      height: rSize * 17,
      width: double.infinity,
      child: PageView.builder(
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          itemCount: Promo.promos.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(rSize),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(rSize * 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'New Collection\n',
                                  style: TextStyle(
                                    fontSize: rSize * 2,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          'Get a 50% discount on your first purchase',
                                      style: TextStyle(
                                        fontSize: rSize,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: rSize),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: rSize * 1,
                                  ),
                                  shadowColor: AppColors.kPrimaryColor,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(rSize * 1.5),
                                  ),
                                  backgroundColor: AppColors.kPrimaryColor,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Shop now!',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: Image.asset(
                            'assets/images/home_suit.png',
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: rSize),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    Promo.promos.length,
                    (index) => Container(
                      height: rSize * 0.7,
                      width: rSize * 0.7,
                      margin: EdgeInsets.only(right: rSize * 0.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == selectedIndex
                            ? AppColors.kPrimaryColor
                            : AppColors.kTertiaryColor.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
