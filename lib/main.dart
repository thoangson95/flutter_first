import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thoitrang/cart.dart';
import 'package:thoitrang/chitietsanpham.dart';
import 'package:thoitrang/dangky.dart';
import 'package:thoitrang/filterscreen.dart';
import 'package:thoitrang/hangmoive.dart';
import 'package:thoitrang/homescreen.dart';
import 'package:thoitrang/xacnhancode.dart';
import 'icons_class/Custom_icons.dart';
import 'quenmatkhau.dart';
import 'dangnhap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final testRoute = GoRouter(
      initialLocation: '/home',
      navigatorKey: rootNavigatorKey,
      routes: [
        ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) => ScaffoldWithAppbar(body: child),
          routes: [
            GoRoute(
              path: '/sign-in',
              parentNavigatorKey: shellNavigatorKey,
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
              parentNavigatorKey: shellNavigatorKey,
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
              parentNavigatorKey: shellNavigatorKey,
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
              parentNavigatorKey: shellNavigatorKey,
              pageBuilder: (context, state) => CustomTransitionPage(
                child: const Xacnhancode(),
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
        ShellRoute(
          builder: (context, state, child) => ScaffoldLayout(body: child),
          navigatorKey: shellNavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              parentNavigatorKey: shellNavigatorKey,
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
          pageBuilder: (context, state) => CustomTransitionPage(
            child: Chitietsanpham(
              url: state.queryParams['url'],
              name: state.queryParams['name'],
              price: state.queryParams['price'],
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
      ],
    );

    return MaterialApp.router(
      routerConfig: testRoute,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.white, elevation: 0),
        // useMaterial3: true,
        fontFamily: 'UTMAvo',
      ),
    );
  }
}

class ScaffoldWithAppbar extends StatefulWidget {
  const ScaffoldWithAppbar({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  State<ScaffoldWithAppbar> createState() => _ScaffoldWithAppbarState();
}

class _ScaffoldWithAppbarState extends State<ScaffoldWithAppbar> {
  @override
  Widget build(BuildContext context) {
    String curentLocation = GoRouter.of(context).location;
    List<Widget> listAction = [];
    Widget? leading;
    switch (curentLocation) {
      case '/sign-in':
        listAction = [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                context.push('/sign-up');
              },
              child: const Text(
                "Đăng ký",
                style: TextStyle(
                  fontSize: 14,
                  height: 19 / 14,
                  color: Color(0xffA4A4A4),
                ),
              ),
            ),
          ),
        ];
        break;
      case '/sign-up':
        listAction = [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                context.go('/sign-in');
              },
              child: const Text(
                "Đăng Nhập",
                style: TextStyle(
                  fontSize: 14,
                  height: 19 / 14,
                  color: Color(0xffA4A4A4),
                ),
              ),
            ),
          ),
        ];
        break;
    }

    switch (curentLocation) {
      case '/sign-up':
      case '/forgot-password':
      case '/verify-code':
        leading = IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
          color: const Color(0xFF222222),
        );
        break;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: curentLocation == '/sign-in' ? false : true,
      appBar: AppBar(
        leading: leading,
        actions: listAction,
      ),
      body: widget.body,
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
      initialLocation: '/home',
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
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        title: InkWell(
          onTap: () {
            context.go("/sign-in");
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFecb1c9),
                child: Image.asset(
                  "assets/categories_image/avatar.png",
                  width: 40,
                  height: 40,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 14),
                child: Text(
                  "La Rosa’s",
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.35,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            onPressed: () {
              context.push("/cart");
            },
            icon: Image.asset("assets/categories_image/Bag.png"),
            iconSize: 22,
          ),
        ],
      ),
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) => _onItemTapped(context, value),
        iconSize: 24,
        selectedIconTheme: const IconThemeData(color: Color(0xffFF7465)),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: tabs,
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
