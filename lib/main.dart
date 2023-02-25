import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/screens/account/account.dart';
import 'package:thoitrang/screens/account/forget_password.dart';
import 'package:thoitrang/screens/account/forget_password_submit.dart';
import 'package:thoitrang/screens/order/order_success.dart';
import 'package:thoitrang/screens/product/filter.dart';
import 'package:thoitrang/screens/product/grid_product.dart';
import 'package:thoitrang/screens/product/product_detail.dart';
import 'package:thoitrang/screens/product/products.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const TestAPI();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'account',
          builder: (BuildContext context, GoRouterState state) {
            return const AccountScreen();
          },
        ),
        GoRoute(
          path: 'products',
          builder: (BuildContext context, GoRouterState state) {
            return const ProductsScreen();
          },
        ),
        GoRoute(
          path: 'product-detail',
          builder: (BuildContext context, GoRouterState state) {
            return const ProductDetailScreen();
          },
        ),
        GoRoute(
          path: 'filter',
          builder: (BuildContext context, GoRouterState state) {
            return const FilterScreen();
          },
        ),
        GoRoute(
          path: 'order-success',
          builder: (BuildContext context, GoRouterState state) {
            return const OrderSuccessScreen();
          },
        ),
        GoRoute(
          path: 'forget-password',
          builder: (BuildContext context, GoRouterState state) {
            return const ForgetPasswordScreen();
          },
        ),
        GoRoute(
          path: 'check-code',
          builder: (BuildContext context, GoRouterState state) {
            return const CheckCodeScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Fashion Store',
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      checkerboardRasterCacheImages: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'UTMAvo'),
    );
  }
}
