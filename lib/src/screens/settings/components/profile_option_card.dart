import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../app_components/app_components.dart';
import '../../../colors.dart';
import '../../../models/profile.dart';
import '../../../size_setup.dart';

class ProfileOptionCard extends StatelessWidget {
  const ProfileOptionCard({super.key, required this.option});
  final ProfileOption option;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return InkWell(
      borderRadius: BorderRadius.circular(rSize * 2.5),
      onTap: () {
        switch (option.title) {
          case 'Help Center':
            context.goNamed('help');
          case 'Settings':
            context.pushNamed('settings');
          case 'Payment Methods':
            context.goNamed('payment');
          case 'Sign Out':
            showModalBottomSheet(
              context: context,
              builder: ((context) {
                return const SignOutConfirmation();
              }),
            );
          case 'My Orders':
            context.pushNamed('order');
        }
      },
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rSize * 2.5),
        ),
        child: Padding(
          padding: EdgeInsets.all(rSize * 1.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    option.icon,
                    height: rSize * 2,
                    colorFilter: const ColorFilter.mode(
                      AppColors.kPrimaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: rSize * 2),
                  Text(
                    option.title,
                    style: TextStyle(fontSize: rSize * 1.7),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.kPrimaryColor,
                size: rSize * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
