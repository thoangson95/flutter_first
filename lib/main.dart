import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thoitrang/product_detail/layout_product_detail.dart';
import 'constants.dart';
import 'home/layout_home.dart';
import 'home/screen/loading_screen.dart';
import 'user/screen/user_screen.dart';
import 'user/screen/widget/forget_code_widget.dart';
import 'user/screen/widget/forget_widget.dart';
import 'user/screen/widget/login_widget.dart';
import 'user/screen/widget/register_widget.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  initialLocation: '/loader',
  routes: <RouteBase>[
    GoRoute(
      path: '/loader',
      builder: (BuildContext context, GoRouterState state) {
        return const LoadingScreen();
      },
    ),
    GoRoute(
      path: '/user',
      builder: (BuildContext context, GoRouterState state) {
        return const UserPage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: '/forget',
      builder: (BuildContext context, GoRouterState state) {
        return const ForgetPage();
      },
    ),
    GoRoute(
      path: '/forget-code',
      builder: (BuildContext context, GoRouterState state) {
        return const ForgetCodePage();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const LayoutHome();
      },
    ),
    // GoRoute(
    //   path: '/product-new',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const ProductNewPage();
    //   },
    // ),
    LayoutProductDeatil.goRoute(),
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
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme),
        primaryColor: colorMain,
      ),
      routerConfig: _router,
      builder: (context, child) => Stack(
        children: [child!, const DropdownAlert()],
      ),
    );
  }
}
