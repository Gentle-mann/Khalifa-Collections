import 'package:flutter/material.dart';
import 'package:seed/src/models/products_model.dart';
import 'package:seed/src/screens/location_request/location_request_screen.dart';
import 'package:seed/src/screens/track_order/track_order_screen.dart';

import 'screens/change_password/change_password_screen.dart';
import 'screens/details/details_screen.dart';
import 'screens/help_center/help_center_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/notification/notification_screen.dart';
import 'screens/payment_methods/payment_methods_screen.dart';
import 'screens/privacy_policy/privacy_policy_screen.dart';
import 'screens/profile_completion/profile_completion.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/signin/signin_screen.dart';
import 'screens/signup/signup_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/verify_otp/verify_otp_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/home/tabs/wishlist/wishlist_screen.dart';

class AppRoutes {
  static final routes = {
    WelcomeScreen.routeName: (context) => const WelcomeScreen(),
    SignUpScreen.routeName: (context) => const SignUpScreen(),
    SignInScreen.routeName: (context) => const SignInScreen(),
    ChangePasswordScreen.routeName: (context) => const ChangePasswordScreen(),
    VerifyOTPScreen.routeName: (context) => const VerifyOTPScreen(),
    ProfileCompletionScreen.routeName: (context) =>
        const ProfileCompletionScreen(),
    LocationRequestScreen.routeName: (context) => const LocationRequestScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    DetailsScreen.routeName: (context) => DetailsScreen(
        product: ModalRoute.of(context)?.settings.arguments as Products),
    WishlistTab.routeName: (context) => const WishlistTab(),
    TrackOrderScreen.routeName: (context) => const TrackOrderScreen(),
    HelpCenterScreen.routeName: (context) => const HelpCenterScreen(),
    SettingsScreen.routeName: (context) => const SettingsScreen(),
    NotificationScreen.routeName: (context) => const NotificationScreen(),
    PaymentMethodsScreen.routeName: (context) => const PaymentMethodsScreen(),
    PrivacyPolicyScreen.routeName: (context) => const PrivacyPolicyScreen(),
    SplashScreen.routeName: (context) => const SplashScreen(),
  };
}
