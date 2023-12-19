import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/app_theme/dark_theme.dart';
import 'package:seed/src/provider/app_state_provider.dart';
import 'package:seed/src/provider/auth_provider.dart';
import 'package:seed/src/provider/auth_validation_provider.dart';
import 'package:seed/src/provider/wishlist_provider.dart';
import 'package:seed/src/router.dart';

import 'src/app_theme/light_theme.dart';
import 'src/provider/cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appStateProvider = AppStateProvider();
  final wishListProvider = WishlistProvider();
  await appStateProvider.initializeApp();
  await wishListProvider.initializeApp();

  runApp(
    Seed(
      appStateProvider: appStateProvider,
      wishlistProvider: wishListProvider,
    ),
  );
}

class Seed extends StatefulWidget {
  const Seed(
      {super.key,
      required this.appStateProvider,
      required this.wishlistProvider});
  final AppStateProvider appStateProvider;
  final WishlistProvider wishlistProvider;

  @override
  State<Seed> createState() => _SeedState();
}

class _SeedState extends State<Seed> {
  @override
  Widget build(BuildContext context) {
    late final appRouter = AppRouter(appStateProvider: widget.appStateProvider);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => widget.appStateProvider),
          ChangeNotifierProvider(create: (context) => AuthValidationProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => widget.wishlistProvider),
        ],
        builder: (context, child) {
          return Consumer<AppStateProvider>(
              builder: (context, appStateProvider, child) {
            final themeMode =
                appStateProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light;
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Seed',
              themeMode: themeMode,
              theme: LightTheme.lightTheme(),
              darkTheme: DarkTheme.darkTheme(),
              routerDelegate: appRouter.router.routerDelegate,
              routeInformationParser: appRouter.router.routeInformationParser,
              routeInformationProvider:
                  appRouter.router.routeInformationProvider,
            );
          });
        });
  }
}
