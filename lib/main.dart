import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/model/product_model.dart';
import 'package:thoitrang/template/account/account.dart';
import 'package:thoitrang/template/auth/dangky.dart';
import 'package:thoitrang/template/auth/dangnhap.dart';
import 'package:thoitrang/template/auth/quenmatkhau.dart';
import 'package:thoitrang/template/auth/xacnhancode.dart';
import 'package:thoitrang/template/order/cart.dart';
import 'package:thoitrang/template/home/homescreen.dart';
import 'package:thoitrang/template/order/cartdetail.dart';
import 'package:thoitrang/template/order/cartsuccess.dart';
import 'package:thoitrang/template/order/orderdetail.dart';
import 'package:thoitrang/template/order/orders.dart';
import 'package:thoitrang/template/product/chitietsanpham.dart';
import 'package:thoitrang/template/product/filterscreen.dart';
import 'package:thoitrang/template/product/hangmoive.dart';
import 'icons_class/Custom_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final rootNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final testRoute = GoRouter(
      initialLocation: '/sign-in',
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
          path: '/sign-in',
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const Dangnhap(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          ),
        ),
        GoRoute(
          path: '/sign-up',
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const Dangky(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          ),
        ),
        GoRoute(
          path: '/forgot-password',
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const Quenmatkhau(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          ),
        ),
        GoRoute(
          path: '/verify-code',
          name: "verify.code",
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: Xacnhancode(
              phoneNumber: state.queryParams['PhoneNumber'] ?? "",
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          ),
        ),
        ShellRoute(
          builder: (context, state, child) => ScaffoldLayout(body: child),
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => CustomTransitionPage(
                child: const Homescreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        SlideTransition(
                            position: animation.drive(
                              Tween<Offset>(
                                begin: const Offset(1, 0),
                                end: Offset.zero,
                              ).chain(CurveTween(curve: Curves.easeIn)),
                            ),
                            child: child),
              ),
            ),
            GoRoute(
              path: '/account',
              pageBuilder: (context, state) => CustomTransitionPage(
                child: const Account(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        SlideTransition(
                            position: animation.drive(
                              Tween<Offset>(
                                begin: const Offset(1, 0),
                                end: Offset.zero,
                              ).chain(CurveTween(curve: Curves.easeIn)),
                            ),
                            child: child),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/filter',
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const Filterscreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          ),
        ),
        GoRoute(
          path: '/product-list',
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const Hangmoive(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          ),
        ),
        GoRoute(
            path: '/product-detail',
            name: 'chitietsanpham',
            parentNavigatorKey: rootNavigatorKey,
            pageBuilder: (context, state) {
              ProductModel model = state.extra as ProductModel;
              return CustomTransitionPage(
                child: Chitietsanpham(model: model),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        SlideTransition(
                            position: animation.drive(
                              Tween<Offset>(
                                begin: const Offset(1, 0),
                                end: Offset.zero,
                              ).chain(CurveTween(curve: Curves.easeIn)),
                            ),
                            child: child),
              );
            }),
        GoRoute(
          path: '/cart',
          name: 'cart',
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const Cart(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          ),
        ),
        GoRoute(
          path: '/cart-detail',
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const Cartdetail(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          ),
        ),
        GoRoute(
          path: '/cart-success',
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const Cartsuccess(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          ),
        ),
        GoRoute(
          path: '/orders',
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const Orders(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          ),
        ),
        GoRoute(
          path: '/order-detail',
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const Orderdetail(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeIn)),
                        ),
                        child: child),
          ),
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: testRoute,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xff333333)),
        ),
        // useMaterial3: true,
        fontFamily: 'UTMAvo',
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class ScaffoldLayout extends StatefulWidget {
  const ScaffoldLayout({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  State<ScaffoldLayout> createState() => _ScaffoldLayoutState();
}

class _ScaffoldLayoutState extends State<ScaffoldLayout> {
  List<CustomBottomNavItem> tabs = [
    const CustomBottomNavItem(
      icon: Icon(Custom.home),
      initialLocation: '/home',
      label: "home",
    ),
    const CustomBottomNavItem(
      icon: Icon(Custom.heart),
      initialLocation: '/home',
      label: "heart",
    ),
    const CustomBottomNavItem(
      icon: Icon(Custom.bell),
      initialLocation: '/home',
      label: "bell",
    ),
    const CustomBottomNavItem(
      icon: Icon(Custom.user),
      initialLocation: '/account',
      label: "user",
    ),
  ];

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Color(0xffe5e5e5), blurRadius: 10)]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (value) => _onItemTapped(context, value),
            iconSize: 24,
            selectedIconTheme: const IconThemeData(color: Color(0xffFF7465)),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: tabs,
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavItem extends BottomNavigationBarItem {
  const CustomBottomNavItem(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);
  final String initialLocation;
}
