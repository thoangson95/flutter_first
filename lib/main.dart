import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'product/products_screen.dart';
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
        // GoRoute(
        //   path: 'home',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const TabBarScreen();
        //   },
        // ),
        GoRoute(
          path: 'products',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const ProductsScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        // GoRoute(
        //   path: 'product-detail/:id',
        //   pageBuilder: (context, state) {
        //     final id = state.params['id'] as String;
        //     return CustomTransitionPage(
        //       key: state.pageKey,
        //       child: ProductDetailScreen(idProduct: id),
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
        //   path: 'filter',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const FilterScreen();
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
