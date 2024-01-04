import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../app_components/app_components.dart';
import '../../../../app_components/custom_text_card.dart';
import '../../../../models/cart_products.dart';
import '../../../../provider/cart_provider.dart';
import '../../../../size_setup.dart';
import 'componenets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<List<CartProduct>> cart;
  bool selectAll = false;
  List<String> allIds = [];

  @override
  void didChangeDependencies() {
    final cartProvider = Provider.of<CartProvider>(context);
    cart = cartProvider.getCart();
    super.didChangeDependencies();
  }

  Future onRefresh() async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cart = cartProvider.getCart();
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    final provider = Provider.of<CartProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: rSize * 2,
        vertical: rSize * 3,
      ),
      child: Column(
        children: [
          const ScreenTitleRow(
            title: 'My Cart',
            shouldAddBackButton: false,
          ),
          SizedBox(height: rSize * 2),
          Consumer<CartProvider>(builder: (context, cartProvider, child) {
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: FutureBuilder(
                  future: cart,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (snapshot.hasError) {
                      return RefreshIndicator(
                        onRefresh: onRefresh,
                        child: SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: ListView(
                            children: const [
                              Text(
                                  'Error Found: Poor connection or no internet. Pull down to refresh'),
                            ],
                          ),
                        ),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: Text('No data'),
                      );
                    } else if (snapshot.data!.isEmpty) {
                      return const Text(
                        'My Cart is Empty (for now). Add products to cart to view them here',
                        style: TextStyle(fontSize: 20),
                      );
                    } else {
                      return Column(
                        children: [
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: cartProvider.ids == allIds,
                            onChanged: (value) {
                              for (var element in snapshot.data!) {
                                allIds.add(element.id);
                              }
                              if (cartProvider.ids != allIds) {
                                cartProvider.ids = allIds;
                              } else {
                                allIds = [];
                                cartProvider.ids = [];
                              }

                              cartProvider.setCheckoutList = snapshot.data!;
                            },
                            title: const Text('Select all'),
                          ),
                          SizedBox(
                            height: SizeSetup.height! * 0.6,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final cartItem = snapshot.data![index];
                                return GestureDetector(
                                  onTap: () {
                                    !cartProvider.ids.contains(cartItem.id)
                                        ? cartProvider.ids.add(cartItem.id)
                                        : cartProvider.ids.removeWhere(
                                            (element) =>
                                                element == cartItem.id);

                                    cartProvider.checkout
                                        .insert(0, snapshot.data![index]);
                                  },
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          value: cartProvider.ids
                                                  .contains(cartItem.id) ||
                                              selectAll,
                                          onChanged: (value) {
                                            setState(() {
                                              !cartProvider.ids
                                                      .contains(cartItem.id)
                                                  ? cartProvider.ids
                                                      .add(cartItem.id)
                                                  : cartProvider.ids
                                                      .removeWhere((element) =>
                                                          element ==
                                                          cartItem.id);
                                            });
                                          }),
                                      Expanded(
                                        child: CartItem(
                                          cartItem: cartItem.cartItem,
                                          cartDeleteId:
                                              snapshot.data![index].id,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: ((context, index) {
                                return Divider(
                                  height: rSize * 4,
                                );
                              }),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
            );
          }),
          const Spacer(),
          allIds.isNotEmpty
              ? CustomButton(
                  onPressed: () {
                    final checkout = provider.findCartById(provider.ids);
                    context.pushNamed(
                      'confirm-order',
                      extra: checkout,
                    );
                  },
                  title: 'Proceed to checkout (${allIds.length})',
                )
              : const CustomTextCard(
                  child: Text('Click on an item to select it'),
                ),
        ],
      ),
    );
  }
}
