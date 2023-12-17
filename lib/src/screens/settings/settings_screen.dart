import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/provider/app_state_provider.dart';
import 'package:seed/src/size_setup.dart';

import '../../app_components/app_components.dart';
import '../../colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: SafeArea(
        child: DefaultPadding(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ScreenTitleRow(title: 'Settings'),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {},
                  child: Card(
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(rSize * 2.5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(rSize * 1.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/dark_mode.svg',
                                height: rSize * 2,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.kPrimaryColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: rSize * 2),
                              Text(
                                'Dark Theme',
                                style: TextStyle(fontSize: rSize * 1.7),
                              ),
                            ],
                          ),
                          Consumer<AppStateProvider>(
                              builder: (context, appStateProvider, child) {
                            return Switch.adaptive(
                              value: appStateProvider.isDarkMode,
                              onChanged: ((value) {
                                appStateProvider.toggleDarkMode(value);
                              }),
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
