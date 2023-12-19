import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seed/src/models/products_model.dart';
import 'package:seed/src/provider/app_state_provider.dart';
import 'package:seed/src/screens/help_center/help_center_screen.dart';
import 'package:seed/src/screens/payment_methods/payment_methods_screen.dart';
import 'package:seed/src/screens/profile_completion/components/profile_completion_form.dart';
import 'package:seed/src/screens/settings/settings_screen.dart';
import 'package:seed/src/screens/track_order/track_order_screen.dart';

import 'screens/confirm_order/confirm_order_screen.dart';
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
          name: 'home',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
                path: 'settings',
                name: 'settings',
                builder: (context, state) => const SettingsScreen(),
                routes: [
                  GoRoute(
                    path: 'profile',
                    name: 'profile',
                    builder: (context, state) => const ProfileCompletionForm(),
                  ),
                  GoRoute(
                    path: 'confirm-order',
                    name: 'confirm-order',
                    builder: (context, state) => const ConfirmOrderScreen(),
                  ),
                  GoRoute(
                    path: 'help',
                    name: 'help',
                    builder: (context, state) => const HelpCenterScreen(),
                  ),
                  GoRoute(
                    path: 'notification',
                    name: 'notification',
                    builder: (context, state) => const TrackOrderScreen(),
                  ),
                  GoRoute(
                    path: 'payment',
                    name: 'payment',
                    builder: (context, state) => const PaymentMethodsScreen(),
                  ),
                ]),
            GoRoute(
                path: 'details',
                name: 'details',
                builder: (context, state) {
                  return DetailsScreen(
                    product: state.extra as Products,
                  );
                }),
          ],
        ),
      ],
      redirect: (context, state) {
        final hasUserOnboarded = appStateProvider.hasOnboarded;
        final isUserOnboarding = state.fullPath == '/welcome';
        if (!hasUserOnboarded) {
          return isUserOnboarding ? null : '/welcome';
        }
        final isRegistered = appStateProvider.isRegistered;
        if (!isRegistered) {
          return '/signup';
        }
        final isUserSignedIn = appStateProvider.isLoggedIn;
        final isSigningIn = state.fullPath == '/';

        if (!isUserSignedIn) {
          return isSigningIn ? null : '/';
        }
        final homePage = appStateProvider.homePage;

        if (isSigningIn || isUserOnboarding) {
          return '/home/$homePage';
        }
        return null;
      });
}
