import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/provider/categories_provider.dart';

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
  int selectedIndex = 0;
  final List<String> categories = [
    'All',
    'Newest',
    'Most Popular',
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
          return Consumer<CategoriesProvider>(
              builder: (context, categoriesProvider, child) {
            return GestureDetector(
              onTap: () {
                categoriesProvider.setIndex(index);
                categoriesProvider.setCategory(categories[index]);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: rSize),
                padding: EdgeInsets.symmetric(
                  horizontal: rSize * 2,
                ),
                decoration: BoxDecoration(
                  color: categoriesProvider.selectedIndex == index
                      ? AppColors.kPrimaryColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(rSize * 3),
                  border: Border.all(),
                ),
                child: Text(
                  newCategories[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: index == categoriesProvider.selectedIndex
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
