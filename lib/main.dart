import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'account/layout_account.dart';
import 'verification_code/layout_verification_code.dart';

import 'filter/layout_filter.dart';
import 'forget_password/layout_forget_password.dart';
import 'product_detail/layout_product_detail.dart';
import 'products/layout_products.dart';
import 'tabbar_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // Hive.registerAdapter(FavoriteProductModelAdapter());
  // await Hive.openBox('favorite_products');
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
        LayoutForgetPassword.goRoute(),
        LayoutVerificationCode.goRoute(),
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
      theme: ThemeData(
          useMaterial3: true, fontFamily: 'UTMAvo', canvasColor: Colors.white),
    );
  }
}
