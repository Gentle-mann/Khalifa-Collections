import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../colors.dart';
import '../../models/expansion_panel_item.dart';
import '../../size_setup.dart';

class ContactUsTab extends StatefulWidget {
  const ContactUsTab({super.key});

  @override
  State<ContactUsTab> createState() => _ContactUsTabState();
}

class _ContactUsTabState extends State<ContactUsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            ContactUsItem.contactItems[panelIndex].isExpanded =
                !ContactUsItem.contactItems[panelIndex].isExpanded;
          });
        },
        children: [
          ...ContactUsItem.contactItems.map<ExpansionPanel>(
            (item) => buildContactPanel(item),
          ),
        ],
      ),
    );
  }

  ExpansionPanel buildContactPanel(ContactUsItem item) {
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
              Expanded(
                child: Text(
                  item.body,
                  maxLines: null,
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
