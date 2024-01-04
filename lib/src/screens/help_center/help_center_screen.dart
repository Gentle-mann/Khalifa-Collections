import 'package:flutter/material.dart';
import 'package:seed/src/app_components/app_components.dart';

import '../../colors.dart';
import '../../size_setup.dart';
import 'component/faq_tab.dart';
import 'contact_us_tab.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});
  static const routeName = '/help';

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen>
    with SingleTickerProviderStateMixin {
  final rSize = SizeSetup.rSize!;
  late TabController tabController;
  final tabs = [
    const Tab(text: 'FAQ'),
    const Tab(text: 'Contact Us'),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultPadding(
          child: Column(
            children: [
              const ScreenTitleRow(
                title: 'Help Center',
              ),
              SizedBox(height: rSize * 2),
              //const SearchField(),
              //SizedBox(height: rSize * 2),
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.symmetric(horizontal: rSize),
                controller: tabController,
                indicatorColor: AppColors.kPrimaryColor,
                tabs: tabs,
              ),
              SizedBox(height: rSize * 2),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    FAQTab(),
                    ContactUsTab(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TabBar buildTabBar() => TabBar(
        controller: tabController,
        onTap: (index) {},
        tabs: tabs,
      );
}
