import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seed/src/app_theme/dark_theme.dart';
import 'package:seed/src/provider/app_state_provider.dart';
import 'package:seed/src/provider/auth_provider.dart';
import 'package:seed/src/provider/auth_validation_provider.dart';
import 'package:seed/src/provider/categories_provider.dart';
import 'package:seed/src/provider/launch_link_provider.dart';
import 'package:seed/src/provider/orders_provider.dart';
import 'package:seed/src/provider/wishlist_provider.dart';
import 'package:seed/src/router.dart';

import 'src/app_theme/light_theme.dart';
import 'src/provider/cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appStateProvider = AppStateProvider();
  await appStateProvider.initializeApp();
  if (!kIsWeb) {
    final wishlistProvider = WishlistProvider();
    wishlistProvider.initialize();
    final ordersProvider = OrdersProvider();
    ordersProvider.initialize();
  }

  runApp(
    Seed(
      appStateProvider: appStateProvider,
      wishlistProvider: wishlistProvider,
      ordersProvider: ordersProvider,
    ),
  );
}

class Seed extends StatefulWidget {
  const Seed({
    super.key,
    required this.appStateProvider,
    required this.wishlistProvider,
    required this.ordersProvider,
  });
  final AppStateProvider appStateProvider;
  final WishlistProvider wishlistProvider;
  final OrdersProvider ordersProvider;

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
          ChangeNotifierProvider(create: (context) => widget.ordersProvider),
          ChangeNotifierProvider(create: (context) => CategoriesProvider()),
          ChangeNotifierProvider(create: (context) => LaunchLinkProvider()),
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
