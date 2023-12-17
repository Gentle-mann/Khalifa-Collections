import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_components/app_components.dart';

import '../../colors.dart';
import '../../size_setup.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({
    super.key,
  });
  static const routeName = '/payment';

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: SafeArea(
        child: DefaultPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ScreenTitleRow(title: 'Payment Methods'),
                SizedBox(height: rSize * 4),
                const StandardBoldText('Credit & Debit Cards'),
                SizedBox(height: rSize),
                const PaymentMethodCard(
                  icon: 'assets/icons/card.svg',
                  title: 'Add a new card',
                ),
                SizedBox(height: rSize * 2),
                const StandardBoldText('More Payment Options'),
                SizedBox(height: rSize * 2),
                const PaymentMethodCard(
                  icon: 'assets/icons/paypal.svg',
                  title: 'Paypal',
                  doesNeedColor: false,
                ),
                SizedBox(height: rSize * 2),
                const PaymentMethodCard(
                  icon: 'assets/icons/apple.svg',
                  title: 'Apple Pay',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({
    super.key,
    required this.icon,
    required this.title,
    this.doesNeedColor = true,
  });
  final String icon, title;
  final bool doesNeedColor;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Container(
      padding: EdgeInsets.all(rSize),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rSize * 2),
        border: Border.all(
          color: AppColors.kSecondaryColor.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                icon,
                height: rSize * 2.5,
                colorFilter: doesNeedColor
                    ? const ColorFilter.mode(
                        AppColors.kPrimaryColor,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
              SizedBox(width: rSize * 2),
              Text(title),
            ],
          ),
          const Text(
            'Link',
            style: TextStyle(
              color: AppColors.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
