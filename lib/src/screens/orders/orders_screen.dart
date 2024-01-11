import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/app_components/app_components.dart';
import 'package:seed/src/provider/launch_link_provider.dart';
import 'package:seed/src/provider/orders_provider.dart';
import 'package:seed/src/size_setup.dart';

import '../../app_components/item_image_card.dart';
import '../../core/utils/snackbar.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Map<String, dynamic>> orders = [];
  @override
  void initState() {
    orders = Provider.of<OrdersProvider>(context, listen: false).orders;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    void showSnackBar() {
      ShowSnackBar.showSnackBar(
          'Text us your order via WhatsApp @ 09033696162', context);
    }

    return Scaffold(
      body: DefaultPadding(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ScreenTitleRow(title: 'My Orders'),
              Consumer<OrdersProvider>(
                  builder: (context, ordersProvider, child) {
                return SizedBox(
                  height: SizeSetup.height! * 0.65,
                  child: ListView.builder(
                    itemCount: ordersProvider.orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return ordersProvider.orders.isEmpty
                          ? Text(
                              'You have no orders yet',
                              style: TextStyle(fontSize: rSize * 2),
                            )
                          : Container(
                              margin: EdgeInsets.only(bottom: rSize),
                              child: Row(
                                children: [
                                  ItemImageCard(imageUrl: order["imageUrl"][0]),
                                  SizedBox(width: rSize),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              order["name"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '₦${order["price"]}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            final key = order["key"];
                                            final id = order["id"];
                                            ordersProvider.deleteOrder(key, id);
                                          },
                                          icon: const Icon(Icons.delete),
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                );
              }),
              CustomButton(
                title: 'Contact Us',
                onPressed: () {
                  Provider.of<LaunchLinkProvider>(context, listen: false)
                      .shareOrderToWhatsApp(
                          'Hello Khalifa Boutique:\n', showSnackBar);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
