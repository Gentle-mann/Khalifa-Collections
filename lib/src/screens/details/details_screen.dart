import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/models/products_model.dart';
import 'package:seed/src/provider/cart_provider.dart';

import '../../app_components/screen_title_row.dart';
import '../../colors.dart';
import '../../size_setup.dart';
import 'components/color_selection.dart';
import 'components/size_selection_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final Products product;

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Scaffold(
      backgroundColor: AppColors.kPostTertiaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeSetup.height! * 0.47,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: rSize * 5,
                      right: rSize * 2,
                      left: rSize * 2,
                      bottom: rSize * 2,
                    ),
                    child: const ScreenTitleRow(
                      title: 'Product Details',
                      shouldAddFav: true,
                    ),
                  ),
                  Stack(
                    children: [
                      Image.network(
                        product.imageUrl[0],
                        height: 300,
                      ),
                      // Positioned(
                      //   bottom: rSize,
                      //   left: rSize * 7,
                      //   child: const Row(
                      //     children: [
                      //       ItemOptionImage(
                      //         image: 'assets/images/shoe1.png',
                      //         color: Color(0xFF954535),
                      //       ),
                      //       ItemOptionImage(
                      //         image: 'assets/images/shoe2.png',
                      //         color: Color(0xFF7B3F00),
                      //       ),
                      //       ItemOptionImage(
                      //         image: 'assets/images/shoe3.png',
                      //         color: Color(0xFFD27D2D),
                      //       ),
                      //       ItemOptionImage(
                      //           image: 'assets/images/shoe4.png',
                      //           color: Color(0xFF954535)),
                      //       ItemOptionImage(
                      //         image: 'assets/images/shoe5.png',
                      //         color: Color(0xFF954535),
                      //       ),
                      //       ItemOptionImage(
                      //         image: 'assets/images/shoe6.png',
                      //         color: Color(0xFFD27D2D),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: SizeSetup.height! * 0.45,
                padding: EdgeInsets.symmetric(
                  horizontal: rSize * 2,
                  vertical: rSize * 3,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.kPostTertiaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.category,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: rSize * 1.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: rSize),
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: rSize * 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: rSize * 1.8),
                    Text(
                      'Product Description',
                      style: TextStyle(
                        fontSize: rSize * 1.8,
                      ),
                    ),
                    Text(
                      product.description,
                    ),
                    const Divider(),
                    SizedBox(height: rSize),
                    Text(
                      'Select size',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: rSize * 1.8,
                      ),
                    ),
                    SizedBox(height: rSize),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...product.sizes.map(
                          (sizes) => SizeSelectionCard(
                            isSelected: sizes.isSelected,
                            title: sizes.size,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: rSize * 1.5),
                    Row(
                      children: [
                        Text(
                          'Select color: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: rSize * 1.8),
                        ),
                        const Text('Brown'),
                      ],
                    ),
                    SizedBox(height: rSize * 0.7),
                    const Row(
                      children: [
                        ColorSelectionCard(color: Color(0xFF704F38)),
                        ColorSelectionCard(
                          color: Color(0xFF954535),
                          isSelected: true,
                        ),
                        ColorSelectionCard(
                          color: Color(0xFF7B3F00),
                        ),
                        ColorSelectionCard(
                          color: Color(0xFFD27D2D),
                        ),
                        ColorSelectionCard(
                          color: Color(0xFF6F4E37),
                        ),
                        ColorSelectionCard(color: Color(0xFF954535)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: rSize,
                horizontal: rSize * 2,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(rSize * 3),
                  topRight: Radius.circular(rSize * 3),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Price:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '₦${product.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: rSize * 6,
                    width: SizeSetup.width! * 0.55,
                    child: ElevatedButton(
                      onPressed: () async {
                        final cartProvider =
                            Provider.of<CartProvider>(context, listen: false);
                        cartProvider.createCart({
                          "id": product.id,
                          "name": product.name,
                          "category": product.category,
                          "subCategory": product.subCategory,
                          "subSubCategory": product.subSubCategory,
                          // "sizes": productNotifier.sizes
                          //.toString(),
                          "imageUrl": product.imageUrl[0],
                          "price": product.price,
                          "qty": 1,
                        });
                        //productNotifier.sizes.clear();
                        //Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/bag_filled.svg',
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: rSize),
                          Text(
                            'Add to cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: rSize * 1.5,
                            ),
                          ),
                        ],
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
  }
}
