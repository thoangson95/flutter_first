import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thoitrang/cart.dart';
import 'package:thoitrang/purchase.dart';
import 'package:thoitrang/successpurchase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: true,
        textTheme:
            GoogleFonts.robotoCondensedTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => Cart(),
        '/hai': (context) => Purchase(),
        '/ba': (context) => SuccessPurchase(),
      },
    );
  }
}
