import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/provider/app_state_provider.dart';
import 'package:seed/src/screens/home/tabs/home/home_tab.dart';
import 'package:seed/src/screens/home/tabs/search/search_tab.dart';

import '../../colors.dart';
import '../../size_setup.dart';
import 'tabs/cart/cart_screen.dart';
import 'tabs/profile/profile_tab.dart';
import 'tabs/wishlist/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final tabs = [
    const HomeTab(),
    const CartScreen(),
    const WishlistTab(),
    const SearchTab(),
    const ProfileTab(),
  ];
  void goToTab(int index) {
    Provider.of<AppStateProvider>(context, listen: false).setHomePage(index);
    setState(() {});
  }

  Widget buildNavBar() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
        bottom: 20,
        top: 0,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.kSecondaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavBarItem(
              icon: 'assets/icons/home.svg',
              onTap: () {
                goToTab(0);
              },
              index: 0,
            ),
            buildNavBarItem(
              icon: 'assets/icons/bag_filled.svg',
              onTap: () {
                goToTab(1);
              },
              index: 1,
            ),
            buildNavBarItem(
              icon: 'assets/icons/heart_filled.svg',
              onTap: () {
                goToTab(2);
              },
              index: 2,
            ),
            buildNavBarItem(
              icon: 'assets/icons/chat.svg',
              onTap: () {
                goToTab(3);
              },
              index: 3,
            ),
            buildNavBarItem(
              icon: 'assets/icons/profile.svg',
              onTap: () {
                goToTab(4);
              },
              index: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(
      {required String icon, required VoidCallback onTap, required int index}) {
    final tab = Provider.of<AppStateProvider>(context, listen: false).homePage;
    final isSelected = tab == index;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? AppColors.kPostTertiaryColor
              : AppColors.kSecondaryColor,
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            isSelected ? AppColors.kPrimaryColor : AppColors.kPostTertiaryColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeSetup().setReferenceSizes(context);
    final tab = Provider.of<AppStateProvider>(context).homePage;
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: tab,
          children: tabs,
        ),
      ),
      bottomNavigationBar: buildNavBar(),
    );
  }
}
