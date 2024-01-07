import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/models/add_to_cart.dart';
import 'package:seed/src/models/products_model.dart';
import 'package:seed/src/provider/app_state_provider.dart';
import 'package:seed/src/provider/cart_provider.dart';
import 'package:seed/src/utils/snackbar.dart';
import '../../app_components/screen_title_row.dart';
import '../../colors.dart';
import '../../size_setup.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});
  final Products product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int activePage = 0;
  String selectedSize = '';
  late final PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    final isDarkMode =
        Provider.of<AppStateProvider>(context, listen: false).isDarkMode;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: isDarkMode ? Colors.black : null,
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: SizeSetup.height,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(
                    height: SizeSetup.height! * 0.47,
                    width: double.infinity,
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
                          ),
                        ),
                        Expanded(
                          child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.product.imageUrl.length,
                              controller: pageController,
                              onPageChanged: (page) {
                                setState(() {
                                  activePage = page;
                                });
                                pageController.animateToPage(
                                  page,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.bounceIn,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: CachedNetworkImage(
                                          imageUrl:
                                              widget.product.imageUrl[index],
                                          height: SizeSetup.height! * 0.4,
                                          fit: BoxFit.contain,
                                          progressIndicatorBuilder:
                                              (context, image, progress) {
                                            return Center(
                                              child: SizedBox(
                                                height: rSize * 3,
                                                width: rSize * 3,
                                                child: CircularProgressIndicator
                                                    .adaptive(
                                                  value: progress.progress,
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                    Positioned(
                                      bottom: 50,
                                      child: Row(
                                        children: List.generate(
                                          widget.product.imageUrl.length,
                                          (index) => Container(
                                            width:
                                                index == activePage ? 25 : 10,
                                            height: rSize,
                                            margin: EdgeInsets.only(
                                                right: rSize * 0.5),
                                            decoration: BoxDecoration(
                                              color: index == activePage
                                                  ? AppColors.kLightPrimary
                                                  : AppColors.kDarkBackground,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                index == activePage
                                                    ? rSize
                                                    : rSize * 0.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: SizeSetup.height! * 0.45,
                    padding: EdgeInsets.symmetric(
                      horizontal: rSize * 2,
                      vertical: rSize * 3,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Product Name',
                            style: TextStyle(
                              fontSize: rSize * 1.8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: rSize * 1.5,
                            ),
                          ),
                          SizedBox(height: rSize),
                          Text(
                            widget.product.category,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: rSize * 1.5,
                            ),
                          ),
                          SizedBox(height: rSize),
                          Text(
                            widget.product.title,
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
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.product.description,
                            maxLines: null,
                            //overflow: TextOverflow.ellipsis,
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
                          SizedBox(
                            width: SizeSetup.width! * 0.9,
                            height: rSize * 4,
                            child: Wrap(
                              children: [
                                ...widget.product.sizes.map(
                                  (sizes) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSize = sizes.size;
                                      });
                                    },
                                    child: ChoiceChip(
                                      label: Text(
                                        sizes.size,
                                        style: const TextStyle(),
                                      ),
                                      selected: sizes.size == selectedSize,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(height: rSize * 1.5),
                          // Row(
                          //   children: [
                          //     Text(
                          //       'Select color: ',
                          //       style: TextStyle(
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: rSize * 1.8),
                          //     ),
                          //     const Text('Brown'),
                          //   ],
                          // ),
                          //
                          //SizedBox(height: rSize * 0.7),
                          // const Row(
                          //   children: [
                          //     ColorSelectionCard(color: Color(0xFF704F38)),
                          //     ColorSelectionCard(
                          //       color: Color(0xFF954535),
                          //       isSelected: true,
                          //     ),
                          //     ColorSelectionCard(t5
                          //       color: Color(0xFF7B3F00),
                          //     ),
                          //     ColorSelectionCard(
                          //       color: Color(0xFFD27D2D),
                          //     ),
                          //     ColorSelectionCard(
                          //       color: Color(0xFF6F4E37),
                          //     ),
                          //     ColorSelectionCard(color: Color(0xFF954535)),
                          //   ],
                          // ),
                          const SizedBox(height: 10),
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
                      //color: Colors.white,
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
                              '₦${widget.product.price}',
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
                              final addToCartModel = AddToCartModel(
                                  cartItem: widget.product.id, quantity: 1);
                              final cartProvider = Provider.of<CartProvider>(
                                  context,
                                  listen: false);

                              await cartProvider
                                  .createCart(addToCartModel)
                                  .then((value) {
                                if (value) {
                                  ShowSnackBar.showSnackBar(
                                      'Added to cart successfully!', context);
                                } else {}
                              });
                              // final cartProvider = Provider.of<CartProvider>(
                              //     context,
                              //     listen: false);
                              // cartProvider.createCart({
                              //   "id": widget.product.id,
                              //   "name": widget.product.name,
                              //   "category": widget.product.category,
                              //   "subCategory": widget.product.subCategory,
                              //   "subSubCategory": widget.product.subSubCategory,
                              //   "sizes": size,
                              //   "imageUrl": widget.product.imageUrl[0],
                              //   "price": widget.product.price,
                              //   "qty": 1,
                              //   "isSelected": false,
                              // });
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
          ),
        ],
      ),
    );
  }
}
