import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/app_components/app_components.dart';
import 'package:seed/src/app_components/screen_title.dart';
import 'package:seed/src/provider/orders_provider.dart';
import 'package:seed/src/size_setup.dart';

import '../../app_components/item_image_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: DefaultPadding(
        child: Column(
          children: [
            const ScreenTitle('My Orders'),
            Consumer<OrdersProvider>(builder: (context, ordersProvider, child) {
              return SizedBox(
                height: SizeSetup.height! * 0.8,
                child: ListView.builder(
                  itemCount: ordersProvider.orders.length,
                  itemBuilder: (context, index) {
                    final order = ordersProvider.orders[index];
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
            const Spacer(),
            CustomButton(
              title: 'Contact Us',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
