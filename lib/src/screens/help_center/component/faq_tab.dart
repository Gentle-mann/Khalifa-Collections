import 'package:flutter/material.dart';

import '../../../models/expansion_panel_item.dart';
import '../../../size_setup.dart';

class FAQTab extends StatefulWidget {
  const FAQTab({super.key});

  @override
  State<FAQTab> createState() => _FAQTabState();
}

class _FAQTabState extends State<FAQTab> {
  String selectedItem = '';
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    ExpansionPanel buildExpansionPanel({required FAQItem item}) {
      return ExpansionPanel(
        canTapOnHeader: true,
        isExpanded: item.isExpanded,
        headerBuilder: ((context, isExpanded) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: rSize,
              vertical: rSize,
            ),
            child: Text(
              item.header,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(item.body),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //const FAQCategories(),
          //SizedBox(height: rSize),
          ExpansionPanelList(
            animationDuration: const Duration(seconds: 1),
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                FAQItem.items[panelIndex].isExpanded =
                    !FAQItem.items[panelIndex].isExpanded;
              });
            },
            children: [
              ...FAQItem.items.map(
                (item) => buildExpansionPanel(item: item),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
