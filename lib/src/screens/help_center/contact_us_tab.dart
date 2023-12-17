import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../colors.dart';
import '../../models/expansion_panel_item.dart';
import '../../size_setup.dart';

class ContactUsTab extends StatelessWidget {
  const ContactUsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        children: [
          ...ContactUsItem.contactItems.map<ExpansionPanel>(
            (item) => buildContactPanel(item),
          ),
        ],
      ),
    );
  }

  ExpansionPanel buildContactPanel(item) {
    final rSize = SizeSetup.rSize!;
    return ExpansionPanel(
      isExpanded: item.isExpanded,
      headerBuilder: ((context, isExpanded) {
        return Container(
          padding: EdgeInsets.all(rSize * 2),
          child: Row(
            children: [
              SvgPicture.asset(
                item.icon,
                height: rSize * 2.5,
                colorFilter: const ColorFilter.mode(
                  AppColors.kPrimaryColor,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: rSize),
              Text(
                item.header,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
//               SvgPicture(BytesLoader('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" version="1.1">
//  <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
// </svg>'),),
            ],
          ),
        );
      }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: rSize * 2),
        child: Padding(
          padding: EdgeInsets.only(
            right: rSize * 2,
            bottom: rSize * 2,
            left: rSize * 2,
          ),
          child: Row(
            children: [
              Container(
                height: rSize * 0.6,
                width: rSize * 0.6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              SizedBox(width: rSize * 0.8),
              const Text('+234 901 1111 111'),
            ],
          ),
        ),
      ),
    );
  }
}
