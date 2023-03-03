import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/account/layout_account.dart';

import 'filter/layout_filter.dart';
import 'product_detail/layout_product_detail.dart';
import 'products/layout_products.dart';
import 'tabbar_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const TabBarScreen();
      },
      routes: <RouteBase>[
        LayoutAccount.goRoute(),
        LayoutProductDetail.goRoute(),
        LayoutProducts.goRoute(),
        LayoutFilter.goRoute(),
        // GoRoute(
        //   path: 'products',
        //   pageBuilder: (context, state) {
        //     return CustomTransitionPage(
        //       key: state.pageKey,
        //       child: const ProductsScreen(),
        //       transitionsBuilder:
        //           (context, animation, secondaryAnimation, child) {
        //         return FadeTransition(
        //           opacity: CurveTween(curve: Curves.easeInOutCirc)
        //               .animate(animation),
        //           child: child,
        //         );
        //       },
        //     );
        //   },
        // ),
        // GoRoute(
        //   path: 'order-success',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const OrderScreen();
        //   },
        // ),
        // GoRoute(
        //   path: 'forget-password',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const ForgetPasswordScreen();
        //   },
        // ),
        // GoRoute(
        //   path: 'check-code',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const CheckCodeScreen();
        //   },
        // ),
      ],
    ),
  ],
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
