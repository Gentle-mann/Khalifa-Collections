import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/models/products_model.dart';
import 'package:seed/src/provider/wishlist_provider.dart';
import 'package:seed/src/services/products_service.dart';

import '../../../size_setup.dart';
import '../../details/details_screen.dart';

class ClothSale extends StatelessWidget {
  const ClothSale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return FutureBuilder(
        future: ProductsService().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
            return SizedBox(
              width: double.infinity,
              height: 200,
              child: GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: rSize,
                      mainAxisSpacing: rSize),
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        final parameters = snapshot.data![index];
                        Navigator.of(context).pushNamed(DetailsScreen.routeName,
                            arguments: parameters);
                      },
                      child: ClothSaleCard(
                        product: snapshot.data![index],
                      ),
                    );
                  })),
            );
          }
        });
  }
}

class ClothSaleCard extends StatefulWidget {
  const ClothSaleCard({
    super.key,
    //this.rating = '4.5',
    this.isFavorite = false,
    this.color = Colors.white,
    required this.product,
  });
  final Products product;

  //final String rating;
  final bool isFavorite;
  final Color color;

  @override
  State<ClothSaleCard> createState() => _ClothSaleCardState();
}

class _ClothSaleCardState extends State<ClothSaleCard> {
  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              //color: Colors.red,
              borderRadius: BorderRadius.circular(rSize),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(rSize),
                  child: Image.network(
                    widget.product.imageUrl[0],
                    fit: BoxFit.fill,
                  ),
                ),
                Consumer<WishlistProvider>(
                    builder: (context, wishlistProvider, child) {
                  return Positioned(
                    top: rSize,
                    right: rSize,
                    child: GestureDetector(
                      onTap: () {
                        if (wishlistProvider.ids.contains(widget.product.id)) {
                          // Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                          //   return const WishlistTab();
                          // })));
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
                          //setState(() {});
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
              // Row(
              //   children: [
              //     Icon(
              //       Icons.star,
              //       color: const Color(
              //         0xFFF9A825,
              //       ),
              //       size: rSize * 2,
              //     ),
              //     // Text(widget.rating),
              //   ],
              // ),
            ],
          ),
        ),
        Center(
          child: Text(
            '₦${widget.product.price}',
            // textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
