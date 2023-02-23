import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/screens/home/home.dart';
import 'package:thoitrang/screens/intro.dart';
import 'package:thoitrang/screens/account/account.dart';
import 'package:thoitrang/screens/account/forget_password.dart';
import 'package:thoitrang/screens/account/forget_password_submit.dart';
import 'package:thoitrang/screens/order/order_success.dart';
import 'package:thoitrang/screens/product/filter.dart';
import 'package:thoitrang/screens/product/product_detail.dart';
import 'package:thoitrang/screens/product/products.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const IntroScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
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

const color1 = Color(0xFFFF7465);
const color2 = Color(0xFF373737);
const color3 = Color(0xFFC2C2C2);
