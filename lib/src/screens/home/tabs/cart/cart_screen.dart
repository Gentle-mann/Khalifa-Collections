import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/app_cache/app_cache.dart';

import '../../../../app_components/app_components.dart';
import '../../../../colors.dart';
import '../../../../provider/cart_provider.dart';
import '../../../../size_setup.dart';
import '../../../track_order/track_order_screen.dart';
import 'componenets/cart_item.dart';
import 'componenets/checkout_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Map<String, dynamic>> cartList;

  @override
  void initState() {
    final appCache = AppCache();
    final cartBox = appCache.getCartBox();
    final cartData = cartBox.keys.map((key) {
      final item = cartBox.get(key);
      return {
        "key": key,
        "id": item["id"],
        "category": item["category"],
        "subCategory": item["subCategory"],
        "subSubCategory": item["subSubCategory"],
        "name": item["name"],
        "imageUrl": item["imageUrl"],
        "price": item["price"],
        "quantity": item["quantity"],
        "sizes": item["sizes"],
        "colors": item["colors"],
      };
    }).toList();
    cartList = cartData.reversed.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: rSize * 2,
        vertical: rSize * 3,
      ),
      child: Column(
        children: [
          const ScreenTitleRow(title: 'My Cart'),
          SizedBox(height: rSize * 3),
          Consumer<CartProvider>(builder: (context, cartProvider, child) {
            return SizedBox(
              height: SizeSetup.height! * 0.65,
              child: ListView.separated(
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  final cartItem = cartList[index];
                  return Dismissible(
                    key: Key(cartItem["id"]),
                    onDismissed: (direction) {
                      showModalBottomSheet(
                        context: context,
                        builder: ((context) {
                          return RemoveFromCardSheet(id: cartItem["id"]);
                        }),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const CheckoutBottomSheet();
                            });
                      },
                      child: CartItem(
                        imageUrl: cartItem["imageUrl"],
                        name: cartItem["name"],
                        price: cartItem["price"],
                      ),
                    ),
                  );
                },
                separatorBuilder: ((context, index) {
                  return Divider(
                    height: rSize * 4,
                  );
                }),
              ),
            );
          }),
          const Spacer(),
          CustomButton(
              onPressed: () {
                Navigator.of(context).pushNamed(TrackOrderScreen.routeName);
              },
              title: 'Proceed'),
        ],
      ),
    );
  }
}

class RemoveFromCardSheet extends StatelessWidget {
  const RemoveFromCardSheet({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Container(
      height: SizeSetup.height! * 0.3,
      padding: EdgeInsets.all(rSize * 2),
      child: Column(
        children: [
          Text(
            'Remove from Cart?',
            style: TextStyle(
              fontSize: rSize * 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(height: rSize * 4),
          // CartItem(
          //   product: id,
          // ),
          const Spacer(),
          SizedBox(
            height: rSize * 7,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.kTertiaryColor.withOpacity(0.05),
                    ),
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                ),
                SizedBox(width: rSize * 2),
                Expanded(
                  child: Consumer<CartProvider>(
                      builder: (context, cartProvider, child) {
                    return ElevatedButton(
                      onPressed: () {
                        //cartProvider.deleteCartItem(id);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                      ),
                      child: const Text(
                        'Yes, remove',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
