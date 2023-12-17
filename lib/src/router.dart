import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seed/src/models/products_model.dart';
import 'package:seed/src/provider/app_state_provider.dart';
import 'package:seed/src/screens/settings/settings_screen.dart';

import 'screens/details/details_screen.dart';
import 'screens/error/error_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/signin/signin_screen.dart';
import 'screens/signup/signup_screen.dart';
import 'screens/welcome/welcome_screen.dart';

class AppRouter {
  final AppStateProvider appStateProvider;
  //final AuthProvider authProvider;
  AppRouter({
    required this.appStateProvider,
  });

  late final router = GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: appStateProvider,
      initialLocation: '/',
      errorPageBuilder: (context, state) => MaterialPage(
            child: ErrorScreen(
              error: state.error.toString(),
            ),
          ),
      routes: [
        GoRoute(
          path: '/welcome',
          name: WelcomeScreen.routeName,
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          path: '/signup',
          name: SignUpScreen.routeName,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: '/',
          name: SignInScreen.routeName,
          builder: (context, state) => const SignInScreen(),
        ),
        //ChangePasswordScreen.routeName: (context) => const ChangePasswordScreen(),
        //VerifyOTPScreen.routeName: (context) => const VerifyOTPScreen(),
        //ProfileCompletionScreen.routeName: (context) =>
        // const ProfileCompletionScreen(),
        //LocationRequestScreen.routeName: (context) => const LocationRequestScreen(),
        GoRoute(
            path: '/home',
            name: HomeScreen.routeName,
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                  path: 'settings',
                  name: 'settings',
                  builder: (context, state) => const SettingsScreen())
            ]),
        GoRoute(
            path: '/details',
            name: DetailsScreen.routeName,
            builder: (context, state) {
              return DetailsScreen(
                product: ModalRoute.of(context)?.settings.arguments as Products,
              );
            }),
        //WishlistTab.routeName: (context) => const WishlistTab(),
        //TrackOrderScreen.routeName: (context) => const TrackOrderScreen(),
        //HelpCenterScreen.routeName: (context) => const HelpCenterScreen(),
        //SettingsScreen.routeName: (context) => const SettingsScreen(),
        //NotificationScreen.routeName: (context) => const NotificationScreen(),
        //PaymentMethodsScreen.routeName: (context) => const PaymentMethodsScreen(),
        //PrivacyPolicyScreen.routeName: (context) => const PrivacyPolicyScreen(),
        //SplashScreen.routeName: (context) => const SplashScreen(),
      ],
      redirect: (context, state) {
        final hasUserOnboarded = appStateProvider.hasOnboarded;
        print('has onboarded: $hasUserOnboarded');
        final isUserOnboarding = state.fullPath == '/welcome';
        if (!hasUserOnboarded) {
          return isUserOnboarding ? null : '/welcome';
        }
        final isUserSignedIn = appStateProvider.isLoggedIn;
        print('signed in: $isUserSignedIn');
        final isSigningIn = state.fullPath == '/';

        if (!isUserSignedIn) {
          return isSigningIn ? null : '/';
        }

        if (isSigningIn || isUserOnboarding) {
          return '/home';
        }
        return null;
      });
}
