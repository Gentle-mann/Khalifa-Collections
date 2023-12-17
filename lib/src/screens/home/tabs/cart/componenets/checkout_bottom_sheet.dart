import 'package:flutter/material.dart';

import '../../../../../app_components/app_components.dart';
import '../../../../../colors.dart';
import '../../../../../size_setup.dart';
import 'price_calc_row.dart';

class CheckoutBottomSheet extends StatelessWidget {
  const CheckoutBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Container(
      padding: EdgeInsets.all(rSize * 2),
      height: SizeSetup.height! * 0.35,
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(rSize),
                width: double.infinity,
                height: rSize * 4.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(rSize * 10),
                  border: Border.all(),
                ),
                child: const Text(
                  'Promo Code',
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: rSize * 2,
                    vertical: rSize,
                  ),
                  height: rSize * 4.5,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(rSize * 10),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: rSize * 2),
          const PriceCalcRow(
            item: 'Sub-total',
            price: '\$407.94',
          ),
          SizedBox(height: rSize),
          const PriceCalcRow(
            item: 'Delivery fee',
            price: '\$25.00',
          ),
          SizedBox(height: rSize),
          const PriceCalcRow(
            item: 'Discount',
            price: '-\$35.00',
          ),
          SizedBox(height: rSize * 2),
          const PriceCalcRow(
            item: 'Sub-total',
            price: '397.94',
          ),
          const Spacer(),
          CustomButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            title: 'Proceed to checkout',
          ),
        ],
      ),
    );
  }
}
