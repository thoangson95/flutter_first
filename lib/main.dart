import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thoitrang/cart.dart';
import 'package:thoitrang/purchase.dart';
import 'package:thoitrang/successpurchase.dart';

void main() {
  runApp(const MyApp());
}

List items = [
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
      {"name": "Áo thun nữ thời trang","pic":"asset/images/Product.png","price":"290.000đ", "amount": 1},
    ];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "UTM Avo",
        scaffoldBackgroundColor: Colors.white,
        // useMaterial3: true,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/hai': (context) => Cart(list: items,),
        '/': (context) => Purchase(list:items),
        '/ba': (context) => SuccessPurchase(),
      },
    );
  }
}
