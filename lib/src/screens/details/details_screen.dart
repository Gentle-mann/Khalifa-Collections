import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/core/responsive/responsive.dart';
import 'package:seed/src/models/add_to_cart.dart';
import 'package:seed/src/models/products_model.dart';
import 'package:seed/src/provider/app_state_provider.dart';
import 'package:seed/src/provider/cart_provider.dart';
import 'package:seed/src/core/utils/snackbar.dart';
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
            pinned: false,
            snap: true,
            floating: true,
            expandedHeight: SizeSetup.width! > 600
                ? SizeSetup.height! * 6
                : SizeSetup.height,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.symmetric(horizontal: rSize),
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeSetup.height! * 0.6,
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
                                    duration: const Duration(milliseconds: 0),
                                    curve: Curves.linear,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return Stack(
                                    alignment: AlignmentDirectional.center,
                                    fit: StackFit.expand,
                                    children: [
                                      CachedNetworkImage(
                                          errorWidget: (context, url, error) =>
                                              const Center(
                                                  child: Text(
                                                      'Error: Image not found!')),
                                          imageUrl:
                                              widget.product.imageUrl[index],
                                          fit: SizeSetup.width! > 600
                                              ? BoxFit.fitHeight
                                              : BoxFit.fitWidth,
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
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //     image: DecorationImage(
                                      //       image: NetworkImage(
                                      //         widget.product.imageUrl[index],
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      Positioned(
                                        bottom: 0,
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
                    SizedBox(height: rSize * 2),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Name',
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
                              'Description',
                              style: TextStyle(
                                  fontSize: rSize * 1.8,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.product.description,
                              maxLines: null,
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
                                        elevation: 5,
                                        label: Text(
                                          sizes.size,
                                        ),
                                        selected: sizes.size == selectedSize,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    //const Spacer(),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: rSize,
                        horizontal: rSize * 2,
                      ),
                      decoration: BoxDecoration(
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
                          Responsive(
                            child: SizedBox(
                              height: rSize * 6,
                              width: SizeSetup.width! * 0.55,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final isLoggedIn =
                                      Provider.of<AppStateProvider>(context,
                                              listen: false)
                                          .isLoggedIn;
                                  if (isLoggedIn) {
                                    final addToCartModel = AddToCartModel(
                                        cartItem: widget.product.id,
                                        quantity: 1);
                                    final cartProvider =
                                        Provider.of<CartProvider>(context,
                                            listen: false);

                                    await cartProvider
                                        .createCart(addToCartModel)
                                        .then((value) {
                                      if (value) {
                                        ShowSnackBar.showSnackBar(
                                            'Added to cart successfully!',
                                            context);
                                      } else {
                                        ShowSnackBar.showSnackBar(
                                            'Unable to add to cart', context);
                                      }
                                    });
                                  } else {
                                    context.go('/guest');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.kPrimaryColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/bag.svg',
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
