import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/app_components/app_components.dart';
import 'package:seed/src/provider/auth_provider.dart';
import 'package:seed/src/size_setup.dart';

import '../../app_components/custom_text_card.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  // late final addressController = TextEditingController();
  String address = '';
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: DefaultPadding(
        child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const ScreenTitleRow(title: 'Add Address'),
                SizedBox(
                  height: rSize * 3,
                ),
                CustomFormField(
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                  hintText: 'Add address',
                  title: 'Add address',
                ),
                CustomButton(
                    title: 'Save',
                    onPressed: () {
                      if (address.isNotEmpty) {
                        authProvider.addAddress(address);
                        authProvider
                            .saveAddress(authProvider.deliveryAddresses);
                      }
                      setState(() {
                        address = '';
                      });
                    }),
                SizedBox(
                  height: rSize * 2,
                ),
                if (authProvider.deliveryAddresses.isNotEmpty)
                  Column(
                    children: [
                      Text(
                        'Your Addresses:',
                        style: TextStyle(fontSize: rSize * 2),
                      ),
                      CustomTextCard(
                        child: Column(
                          children: [
                            ...authProvider.deliveryAddresses.map(
                              (e) => ListTile(
                                title: Text(e),
                                trailing: IconButton(
                                  onPressed: () {
                                    authProvider.removeAddress(e);
                                    authProvider.saveAddress(
                                        authProvider.deliveryAddresses);
                                  },
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ],
            ),
          );
        }),
      ),
    );
  }
}
