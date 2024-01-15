import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/colors.dart';
import 'package:seed/src/models/products_model.dart';
import 'package:seed/src/provider/categories_provider.dart';
import 'package:seed/src/provider/wishlist_provider.dart';

import '../../../core/utils/snackbar.dart';
import '../../../models/add_to_cart.dart';
import '../../../provider/app_state_provider.dart';
import '../../../provider/cart_provider.dart';
import '../../../size_setup.dart';

class ClothSale extends StatefulWidget {
  const ClothSale({
    super.key,
  });

  @override
  State<ClothSale> createState() => _ClothSaleState();
}

class _ClothSaleState extends State<ClothSale> {
  late Future<List<Products>> products;
  String category = 'All';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    category = Provider.of<CategoriesProvider>(context).category;
    products = categoriesProvider.getProducts(category);
  }

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return FutureBuilder(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error Found: Poor connection or no internet.',
                style: TextStyle(
                  fontSize: rSize * 2,
                ),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No data'),
            );
          } else {
            return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                primary: false,
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8,
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 600 ? 4 : 2,
                    crossAxisSpacing: rSize,
                    mainAxisSpacing: rSize),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      final parameters = snapshot.data![index];
                      context.goNamed('details', extra: parameters);
                    },
                    child: ClothSaleCard(
                      product: snapshot.data![index],
                    ),
                  );
                }));
          }
        });
  }
}

class ClothSaleCard extends StatefulWidget {
  const ClothSaleCard({
    super.key,
    this.isFavorite = false,
    this.color = Colors.white,
    required this.product,
  });
  final Products product;

  final bool isFavorite;
  final Color color;

  @override
  State<ClothSaleCard> createState() => _ClothSaleCardState();
}

class _ClothSaleCardState extends State<ClothSaleCard> {
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(rSize),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl: widget.product.imageUrl[0],
                    //fit: BoxFit.fitHeight,
                    progressIndicatorBuilder: (context, url, progress) =>
                        CircularProgressIndicator(
                      value: progress.progress,
                    ),
                    errorWidget: (context, url, error) =>
                        Center(child: Text('Image not found')),
                  ),
                  Consumer<WishlistProvider>(
                      builder: (context, wishlistProvider, child) {
                    return Positioned(
                      top: rSize,
                      right: rSize,
                      child: GestureDetector(
                        onTap: () {
                          if (wishlistProvider.ids
                              .contains(widget.product.id)) {
                          } else {
                            wishlistProvider.createFav({
                              "id": widget.product.id,
                              "name": widget.product.name,
                              "title": widget.product.title,
                              "category": widget.product.category,
                              "price": widget.product.price,
                              "imageUrl": widget.product.imageUrl,
                              "description": widget.product.description,
                              "subCategory": widget.product.subCategory,
                              "subSubCategory": widget.product.subSubCategory,
                            });
                          }
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
                            wishlistProvider.ids.contains(widget.product.id)
                                ? 'assets/icons/heart_red_filled.svg'
                                : 'assets/icons/heart.svg',
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.product.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              '₦${widget.product.price}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: rSize, right: rSize, left: rSize),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kLightPrimary),
                onPressed: () async {
                  final isLoggedIn =
                      Provider.of<AppStateProvider>(context, listen: false)
                          .isLoggedIn;
                  if (isLoggedIn) {
                    final addToCartModel = AddToCartModel(
                        cartItem: widget.product.id, quantity: 1);
                    final cartProvider =
                        Provider.of<CartProvider>(context, listen: false);

                    await cartProvider.createCart(addToCartModel).then((value) {
                      if (value) {
                        ShowSnackBar.showSnackBar(
                            'Added to cart successfully!', context);
                      } else {
                        ShowSnackBar.showSnackBar(
                            'Unable to add to cart', context);
                      }
                    });
                  } else {
                    context.go('/guest');
                  }
                },
                child: const Text(
                  'ADD TO CART',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
