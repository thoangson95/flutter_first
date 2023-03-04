import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/loading/layout_loading.dart';
import 'constants.dart';
import 'forget/layout_forget.dart';
import 'forget_code/layout_forget_code.dart';
import 'home/layout_home.dart';
import 'login/layout_login.dart';
import 'product_detail/layout_product_detail.dart';
import 'register/layout_register.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    LayoutLoading.goRoute(),
    LayoutHome.goRoute(),
    LayoutProductDeatil.goRoute(),
    LayoutLogin.goRoute(),
    LayoutRegister.goRoute(),
    LayoutForget.goRoute(),
    LayoutForgetCode.goRoute()
  ],
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Thời trang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'UA',
        primaryColor: colorMain,
      ),
      routerConfig: _router,
      builder: (context, child) => Stack(
        children: [
          child!,
          const DropdownAlert(),
        ],
      ),
    );
  }
}
