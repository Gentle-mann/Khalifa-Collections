import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../size_setup.dart';

class FAQCategories extends StatefulWidget {
  const FAQCategories({super.key});

  @override
  State<FAQCategories> createState() => _FAQCategoriesState();
}

class _FAQCategoriesState extends State<FAQCategories> {
  int selectedIndex = 0;
  final headings = [
    'All',
    'Services',
    'General',
    'Accounts',
  ];
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          headings.length,
          (index) => Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: rSize),
            padding: EdgeInsets.symmetric(
              horizontal: rSize * 2,
              vertical: rSize,
            ),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? AppColors.kPrimaryColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(rSize * 4),
              border: Border.all(),
            ),
            child: Text(
              headings[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: index == selectedIndex ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
