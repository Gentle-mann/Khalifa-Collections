import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed/src/colors.dart';
import 'package:seed/src/size_setup.dart';
import 'package:seed/src/core/utils/snackbar.dart';

class AccountDetailsCard extends StatelessWidget {
  const AccountDetailsCard({
    super.key,
    required this.accountNumber,
    required this.bankIcon,
    required this.bankName,
    required this.accountName,
    this.isStanbic = false,
    this.isOpay = false,
  });
  final String accountNumber;
  final String bankIcon, bankName, accountName;
  final bool isStanbic, isOpay;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(rSize * 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(rSize * 1.5),
        child: Column(
          children: [
            AccountDetailsInfo(
              icon: 'assets/icons/numbers.svg',
              title: 'Account Number',
              subtitle: accountNumber,
              iconHeight: rSize * 3,
              colorFilter: const ColorFilter.mode(
                AppColors.kLightPrimary,
                BlendMode.srcIn,
              ),
              fontSize: rSize * 2,
              fontWeight: FontWeight.bold,
            ),
            const Divider(),
            AccountDetailsInfo(
              icon: bankIcon,
              title: 'Bank',
              subtitle: bankName,
              iconHeight: isStanbic ? rSize * 8 : rSize * 3,
              colorFilter: isOpay
                  ? const ColorFilter.mode(
                      AppColors.kLightPrimary, BlendMode.srcIn)
                  : null,
            ),
            const Divider(),
            AccountDetailsInfo(
              icon: 'assets/icons/profile.svg',
              title: 'Name',
              subtitle: accountName,
              iconHeight: rSize * 3,
              colorFilter: const ColorFilter.mode(
                AppColors.kLightPrimary,
                BlendMode.srcIn,
              ),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () async {
                await Clipboard.setData(
                  ClipboardData(text: accountNumber),
                ).then(
                  (_) => ShowSnackBar.showSnackBar(
                    'Account Number copied successfully!',
                    context,
                  ),
                );
              },
              child: const Text('Copy Account Number'),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountDetailsInfo extends StatelessWidget {
  const AccountDetailsInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconHeight,
    this.colorFilter,
    this.fontSize,
    this.fontWeight,
  });
  final String icon, title, subtitle;
  final double iconHeight;
  final double? fontSize;
  final ColorFilter? colorFilter;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          icon,
          height: iconHeight,
          colorFilter: colorFilter,
        ),
        SizedBox(
          width: rSize * 2,
        ),
        Column(
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: fontWeight),
            ),
            Text(
              subtitle,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
            ),
          ],
        ),
      ],
    );
  }
}
