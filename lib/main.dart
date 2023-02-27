import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thoitrang/cart.dart';
import 'package:thoitrang/login.dart';
import 'package:thoitrang/purchase.dart';
import 'package:thoitrang/redemcode.dart';
import 'package:thoitrang/splash.dart';
import 'package:thoitrang/successpurchase.dart';

void main() {
  runApp(const MyApp());
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
      color: Color(0xFFFF7465),
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
        '/': (context) => SplashScreen(
              list: items,
            ),
        '/login/redeem': (context) => const Redemcode(phonenumber: "01"),
        '/login': (context) => Login(list: items),
        '/mot': (context) => Cart(
              list: items,
            ),
        '/hai': (context) => Purchase(list: items),
        '/hai/ba': (context) => const SuccessPurchase(),
      },
    );
  }
}
