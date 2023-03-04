import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitrang/cart/screen/cart_screen.dart';
import 'package:thoitrang/login/screen/login_screen.dart';
import 'package:thoitrang/purchase/screen/purchase_screen.dart';
import 'package:thoitrang/redeemcode/screen/redemcode_screen.dart';
import 'package:thoitrang/splash/screen/splash_screen.dart';
import 'package:thoitrang/success/screen/successpurchase_screen.dart';

import 'home/screen/testscreen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

List items = [
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
  {
    "name": "Áo thun nữ thời trang",
    "pic": "asset/images/Product.png",
    "price": "290.000đ",
    "amount": 1,
    "selected": false
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color(0xFFFF7465),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showSemanticsDebugger: !true,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xFFFF7465),
          background: Color(0xFFFF7465),
          brightness: Brightness.light,
          error: Color(0xFFFF7465),
          onBackground: Color(0xFFFF7465),
          onError: Color(0xFFFF7465),
          onPrimary: Color(0xFFFF7465),
          onSecondary: Color(0xFFFF7465),
          onSurface: Color(0xFFFF7465),
          secondary: Color(0xFFFF7465),
          surface: Color(0xFFFF7465),
        ),
        fontFamily: "UTM Avo",
        scaffoldBackgroundColor: Colors.white,
        // useMaterial3: true,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/asdasd': (context) => const TestScreen(),
        '/': (context) => SplashScreen(
              list: items,
            ),
        '/login/redeem': (context) => const RedemcodeScreen(phonenumber: "01"),
        '/login': (context) => LoginScreen(),
        '/mot': (context) => CartScreen(
              list: items,
            ),
        '/hai': (context) => PurchaseScreen(list: items),
        '/hai/ba': (context) => const SuccessPurchaseScreen(),
      },
    );
  }
}
