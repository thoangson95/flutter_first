import 'package:flutter/material.dart';
import 'package:thoitrang/screens/forget_password.dart';
import 'package:thoitrang/screens/forget_password_submit.dart';
import 'package:thoitrang/screens/order_success.dart';
import 'package:thoitrang/screens/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'UTMAvo'),
      initialRoute: '/check-code',
      routes: {
        '/order-sucsess': (context) => const OrderSuccessScreen(),
        '/product-detail': (context) => const ProductDetailScreen(),
        '/forget-password': (context) => const ForgetPasswordScreen(),
        '/check-code': (context) => const CheckCodeScreen(),
      },
    );
  }
}
