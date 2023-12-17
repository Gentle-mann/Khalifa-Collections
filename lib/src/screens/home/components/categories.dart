import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../size_setup.dart';

class Categories extends StatefulWidget {
  const Categories({
    super.key,
    this.categorie,
  });
  final List<String>? categorie;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int index = 0;
  int selectedIndex = 0;
  final List<String> categories = [
    'All',
    'Newest',
    'Popular',
    'Men',
    'Women',
  ];
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    final newCategories = widget.categorie ?? categories;
    return SizedBox(
      height: rSize * 3.6,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newCategories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: rSize),
              padding: EdgeInsets.symmetric(
                horizontal: rSize * 2,
              ),
              decoration: BoxDecoration(
                color: index == selectedIndex
                    ? AppColors.kPrimaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(rSize * 3),
                border: Border.all(),
              ),
              child: Text(
                newCategories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: index == selectedIndex ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
