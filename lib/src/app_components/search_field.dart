import 'package:flutter/material.dart';

import '../colors.dart';
import '../size_setup.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.onChanged,
  });
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(rSize * 1.5),
        prefixIcon: Icon(Icons.search, size: rSize * 3),
        hintText: 'Search',
        suffixIcon: const Icon(
          Icons.cancel,
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
