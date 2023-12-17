import 'package:flutter/material.dart';

import '../../app_components/app_components.dart';
import '../../size_setup.dart';
import 'components/location_row.dart';

class ManualLocationSet extends StatelessWidget {
  const ManualLocationSet({super.key});

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your location'),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(rSize * 2),
        child: Column(
          children: [
            const SearchField(),
            SizedBox(height: rSize),
            const LocationRow(),
            const Divider(),
            SizedBox(height: rSize),
            Column(
              children: [
                const Text('SEARCH RESULT'),
                SizedBox(height: rSize * 0.5),
                const LocationRow(),
                SizedBox(height: rSize * 0.5),
                const Text('8502 Proson Rd, Ingl.')
              ],
            )
          ],
        ),
      ),
    );
  }
}
