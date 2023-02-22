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
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1,"selected":false},
    ];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showSemanticsDebugger: !true,
      theme: ThemeData(
        fontFamily: "UTM Avo",
        scaffoldBackgroundColor: Colors.white,
        // useMaterial3: true,
      ),
      initialRoute: '/', 
      routes: <String, WidgetBuilder>{
        '/': (context) => const SplashScreen(),
        '/login/redeem': (context) => const Redemcode(phonenumber: "01"),
        '/login': (context) => const Login(),
        '/mot': (context) => Cart(list: items,),
        '/hai': (context) => Purchase(list:items),
        '/hai/ba': (context) => const SuccessPurchase(),
      },
    );
  }
}
