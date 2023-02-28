import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thoitrang/templates/user/page_user.dart';
import 'package:thoitrang/templates/product/page_product_new.dart';
import 'home.dart';
import 'models/categories.dart';
import 'templates/user/template_forget.dart';
import 'templates/user/template_forget_code.dart';
import 'templates/user/template_login.dart';
import 'templates/user/template_register.dart';

const categoriesLists = [
  Categories("1", "Categories 1", "assets/images/categories.png"),
  Categories("2", "Categories 2", "assets/images/categories.png"),
  Categories("3", "Categories 3", "assets/images/categories.png"),
  Categories("4", "Categories 4", "assets/images/categories.png"),
  Categories("5", "Categories 5", "assets/images/categories.png"),
  Categories("6", "Categories 6", "assets/images/categories.png"),
  Categories("7", "Categories 7", "assets/images/categories.png"),
  Categories("8", "Categories 8", "assets/images/categories.png"),
  Categories("9", "Categories 9", "assets/images/categories.png"),
  Categories("10", "Categories 10", "assets/images/categories.png"),
  Categories("11", "Categories 11", "assets/images/categories.png"),
  Categories("12", "Categories 12", "assets/images/categories.png"),
];

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
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
        return const HomePages();
      },
    ),
    GoRoute(
      path: '/product-new',
      builder: (BuildContext context, GoRouterState state) {
        return const ProductNewPage();
      },
    ),
    // ShellRoute(
    //   builder: (BuildContext context, GoRouterState state, Widget child) {
    //     return const LoginPage();
    //   },
    //   routes: <RouteBase>[
    //     /// The first screen to display in the bottom navigation bar.
    //     GoRoute(
    //       path: '/login',
    //       builder: (BuildContext context, GoRouterState state) {
    //         return const LoginPage();
    //       },
    //       // routes: <RouteBase>[
    //       //   // The details screen to display stacked on the inner Navigator.
    //       //   // This will cover screen A but not the application shell.
    //       //   GoRoute(
    //       //     path: 'home',
    //       //     builder: (BuildContext context, GoRouterState state) {
    //       //       return const HomePage();
    //       //     },
    //       //   ),
    //       // ],
    //     ),
    //     GoRoute(
    //       path: '/home',
    //       builder: (BuildContext context, GoRouterState state) {
    //         return const HomePage();
    //       },
    //       // routes: <RouteBase>[
    //       //   /// Same as "/a/details", but displayed on the root Navigator by
    //       //   /// specifying [parentNavigatorKey]. This will cover both screen B
    //       //   /// and the application shell.
    //       //   GoRoute(
    //       //     path: 'details',
    //       //     parentNavigatorKey: _rootNavigatorKey,
    //       //     builder: (BuildContext context, GoRouterState state) {
    //       //       return const DetailsScreen(label: 'B');
    //       //     },
    //       //   ),
    //       // ],
    //     ),
    //   ],
    // ),
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
        primaryColor: const Color(0xFFFF7465),
      ),
      routerConfig: _router,
      builder: (context, child) => Stack(
        children: [child!, const DropdownAlert()],
      ),
    );
  }
}
