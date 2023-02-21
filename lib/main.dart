import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/screens/home.dart';
import 'package:thoitrang/screens/intro.dart';
import 'package:thoitrang/screens/account.dart';
import 'package:thoitrang/screens/forget_password.dart';
import 'package:thoitrang/screens/forget_password_submit.dart';
import 'package:thoitrang/screens/order_success.dart';
import 'package:thoitrang/screens/product_detail.dart';

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
          path: 'product-detail',
          builder: (BuildContext context, GoRouterState state) {
            return const ProductDetailScreen();
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
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      checkerboardRasterCacheImages: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'UTMAvo'),
    );
  }
}
