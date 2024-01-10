import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed/src/provider/launch_link_provider.dart';
import 'package:seed/src/utils/snackbar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/app_components/account_details_card.dart';
import 'package:seed/src/models/cart_products.dart';
import 'package:seed/src/provider/auth_provider.dart';
import 'package:seed/src/provider/orders_provider.dart';
import 'package:seed/src/screens/home/tabs/cart/componenets/cart_item.dart';
import 'package:seed/src/size_setup.dart';

import '../../app_components/app_components.dart';
import '../../app_components/custom_text_card.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({super.key, required this.checkoutItems});
  final List<CartProduct> checkoutItems;

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  late double totalCost;
  List<Map<String, dynamic>> ordersList = [];

  @override
  void initState() {
    double calculateTotalCost() {
      double price = 0;
      for (var i in widget.checkoutItems) {
        final String cost = i.cartItem.price;
        price += double.parse(cost.replaceAll(',', ''));
      }
      return price;
    }

    totalCost = calculateTotalCost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: rSize * 4,
        vertical: rSize * 4,
      ),
      child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenTitleRow(title: 'Confirm your Order'),
              SizedBox(height: rSize * 2),
              if (authProvider.deliveryAddresses.isNotEmpty)
                SizedBox(
                  height: rSize * 15,
                  child: ListView.builder(
                      itemCount: authProvider.deliveryAddresses.length,
                      itemBuilder: (context, index) {
                        return CustomTextCard(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: authProvider.selectedAddress ==
                                          authProvider.deliveryAddresses[index],
                                      onChanged: (value) {
                                        authProvider.selectAddress(authProvider
                                            .deliveryAddresses[index]);
                                      }),
                                  SizedBox(width: rSize),
                                  SvgPicture.asset(
                                    'assets/icons/location.svg',
                                    height: rSize * 2,
                                  ),
                                  SizedBox(
                                    width: rSize,
                                  ),
                                  Expanded(
                                    child: Text(
                                      authProvider.deliveryAddresses[index],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: rSize * 1.5,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              CustomTextCard(
                child: GestureDetector(
                  onTap: () {
                    context.pushNamed('add-address');
                  },
                  child: Text(
                    '+ Add address',
                    style: TextStyle(
                      fontSize: rSize * 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const AccountDetailsCard(
                accountNumber: '6408272378',
                bankIcon: 'assets/icons/moniepoint.svg',
                bankName: 'MoniePoint',
                accountName: 'Khalifa Boutiquee',
              ),
              ElevatedButton(
                onPressed: () {
                  context.goNamed('payment');
                },
                child: const Text('Use another account number'),
              ),
              SizedBox(
                height: rSize,
              ),
              Text(
                'Orders',
                style: TextStyle(fontSize: rSize * 2),
              ),
              SizedBox(
                height: SizeSetup.height! * 0.33,
                child: ListView.builder(
                  itemCount: widget.checkoutItems.length,
                  primary: false,
                  //shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final checkout = widget.checkoutItems[index];
                    return CartItem(
                      cartItem: checkout.cartItem,
                      cartDeleteId: '',
                      shouldDelete: false,
                    );
                  },
                ),
              ),
              CustomTextCard(
                child: Text(
                  'Total cost: ₦${totalCost.toInt()}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              CustomButton(
                title: 'Confirm Order & Contact Us',
                onPressed: () async {
                  List<String> orderNameList = [];
                  String message = 'Hey Khalifa Collections, I have ordered:\n';
                  final ordersProvider =
                      Provider.of<OrdersProvider>(context, listen: false);
                  for (var element in widget.checkoutItems) {
                    final order = {
                      "id": element.cartItem.id,
                      "category": element.cartItem.category,
                      "name": element.cartItem.name,
                      "imageUrl": element.cartItem.imageUrl,
                      "price": element.cartItem.price,
                    };
                    ordersList.add(order);
                    orderNameList.add(element.cartItem.name);
                  }

                  ordersProvider.createOrder(ordersList);
                  for (var element in orderNameList) {
                    message +=
                        '${orderNameList.indexOf(element) + 1}. $element\n';
                  }
                  message +=
                      'Delivery Address: ${authProvider.selectedAddress}\nTotal Cost: ₦${totalCost.toInt()}';

                  shareOrderToWhatsApp(message);
                },
              ),
            ],
          ),
        );
      }),
    ));
  }

  void showSnackBar() {
    ShowSnackBar.showSnackBar(
        'Text us your order via WhatsApp @ 09033696162', context);
  }

  shareOrderToWhatsApp(String message) async {
    Provider.of<LaunchLinkProvider>(context, listen: false)
        .shareOrderToWhatsApp(message, showSnackBar);
  }
}
