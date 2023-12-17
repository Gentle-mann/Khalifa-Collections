import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/models/products_model.dart';
import 'package:seed/src/provider/wishlist_provider.dart';
import 'package:seed/src/screens/home/tabs/cart/componenets/cart_item.dart';

import '../../../../app_components/screen_title_row.dart';
import '../../../../size_setup.dart';
import '../../components/categories.dart';

class WishlistTab extends StatefulWidget {
  const WishlistTab({super.key});
  static const routeName = '/wishlist';

  @override
  State<WishlistTab> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab> {
  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Jacket', 'Shirt', 'Pant', 'T-shirt', 'Shoe'];
    final rSize = SizeSetup.rSize!;
    final wishlistProvider = Provider.of<WishlistProvider>(context);

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
              title: 'My Wishlist',
            ),
            SizedBox(height: rSize * 2),
            Categories(
              categorie: categories,
            ),
            SizedBox(height: rSize * 2),
            SizedBox(
              height: SizeSetup.height! * 0.7,
              child: ListView.builder(
                  itemCount: wishlistProvider.ids.length,
                  itemBuilder: ((context, index) {
                    final favorites = wishlistProvider.getAllData()[index];
                    final product = Products(
                      id: favorites["id"],
                      name: favorites["name"],
                      title: '',
                      category: favorites["category"],
                      imageUrl: favorites["imageUrl"],
                      price: favorites["price"],
                      sizes: [],
                      description: '',
                      subCategory: favorites["subCategory"],
                      subSubCategory: favorites["subSubCategory"],
                      updatedAt: '',
                    );
                    return GestureDetector(
                      onTap: () {
                        wishlistProvider.removeFav(favorites["key"]);
                        wishlistProvider.ids.removeWhere(
                            (element) => element == favorites["id"]);
                        setState(() {});
                      },
                      child: CartItem(
                        imageUrl: product.imageUrl[0],
                        name: product.name,
                        price: product.price,
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
