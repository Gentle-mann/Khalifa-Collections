import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seed/src/models/cart_products.dart';
import 'package:seed/src/models/products_model.dart';
import 'package:seed/src/screens/home/tabs/cart/componenets/cart_item.dart';
import 'package:seed/src/services/products_service.dart';
import 'package:seed/src/size_setup.dart';

import '../../../../colors.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String searchQuery = '';
  late final searchController = TextEditingController();
  Future<List<Products>> searchResults() async {
    return await ProductsService().searchProducts(searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: rSize, vertical: rSize * 2),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(rSize * 1.5),
                      prefixIcon: Icon(Icons.search, size: rSize * 3),
                      hintText: 'Search',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            searchQuery = '';
                            searchController.clear();
                          });
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(width: rSize),
                // Container(
                //   height: rSize * 4,
                //   width: rSize * 4,
                //   padding: EdgeInsets.all(rSize * 0.4),
                //   decoration: const BoxDecoration(
                //     color: AppColors.kPrimaryColor,
                //     shape: BoxShape.circle,
                //   ),
                //   child: SvgPicture.asset(
                //     'assets/icons/filter.svg',
                //     height: rSize * 3,
                //     colorFilter: const ColorFilter.mode(
                //       Colors.white,
                //       BlendMode.srcIn,
                //     ),
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: rSize,
            ),
            searchQuery.isEmpty
                ? const Text(
                    'Search products to see them here',
                    style: TextStyle(fontSize: 20),
                  )
                : Expanded(
                    child: FutureBuilder(
                        future: searchResults(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error Found: ${snapshot.error}');
                          } else if (!snapshot.hasData) {
                            return const Center(
                              child: Text('No data'),
                            );
                          } else {
                            final data = snapshot.data!;
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  final product = data[index];
                                  final item = ProductItem(
                                      id: product.id,
                                      name: product.name,
                                      category: product.category,
                                      imageUrl: product.imageUrl,
                                      price: product.price);
                                  return GestureDetector(
                                    onTap: () {
                                      final searchProduct = Products(
                                          id: product.id,
                                          name: product.name,
                                          title: product.title,
                                          category: product.category,
                                          imageUrl: product.imageUrl,
                                          price: product.price,
                                          sizes: product.sizes,
                                          description: product.description,
                                          subCategory: product.subCategory,
                                          subSubCategory:
                                              product.subSubCategory,
                                          updatedAt: '');
                                      context.pushNamed('details',
                                          extra: searchProduct);
                                    },
                                    child: CartItem(
                                      cartItem: item,
                                      cartDeleteId: '',
                                      shouldDelete: false,
                                    ),
                                  );
                                });
                          }
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}
