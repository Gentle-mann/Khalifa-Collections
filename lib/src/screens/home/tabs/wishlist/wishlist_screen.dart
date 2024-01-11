import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/models/products_model.dart';
import 'package:seed/src/provider/wishlist_provider.dart';

import '../../../../app_components/item_image_card.dart';
import '../../../../app_components/screen_title_row.dart';
import '../../../../size_setup.dart';

class WishlistTab extends StatefulWidget {
  const WishlistTab({super.key});

  @override
  State<WishlistTab> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab> {
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Padding(
      padding: EdgeInsets.only(
        top: rSize * 4,
        right: rSize * 2,
        left: rSize * 2,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ScreenTitleRow(
              title: 'My Favorites',
              shouldAddBackButton: false,
            ),
            SizedBox(height: rSize * 4),
            SizedBox(
              height: SizeSetup.height! * 0.7,
              child: Consumer<WishlistProvider>(
                  builder: (context, wishlistProvider, child) {
                return ListView.builder(
                  itemCount: wishlistProvider.getAllData().length,
                  itemBuilder: ((context, index) {
                    final favorites = wishlistProvider.getAllData()[index];

                    return GestureDetector(
                      onTap: () {
                        final product = Products(
                          id: favorites["id"],
                          name: favorites["name"],
                          title: favorites["title"],
                          category: favorites["category"],
                          imageUrl: favorites["imageUrl"],
                          price: favorites["price"],
                          sizes: [],
                          description: favorites["description"] ?? '',
                          subCategory: favorites["subCategory"],
                          subSubCategory: favorites["subSubCategory"],
                          updatedAt: '',
                        );
                        context.pushNamed('details', extra: product);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: rSize),
                        child: Row(
                          children: [
                            ItemImageCard(imageUrl: favorites["imageUrl"][0]),
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
                                        favorites["name"],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '₦${favorites["price"]}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      wishlistProvider
                                          .removeFav(favorites["key"]);
                                      wishlistProvider.ids.removeWhere(
                                          (element) =>
                                              element == favorites["id"]);
                                    },
                                    child: Container(
                                      height: rSize * 3,
                                      width: rSize * 3,
                                      padding: EdgeInsets.all(rSize * 0.5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                      child: SvgPicture.asset(
                                        wishlistProvider.ids
                                                .contains(favorites["id"])
                                            ? 'assets/icons/heart_red_filled.svg'
                                            : 'assets/icons/heart.svg',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
