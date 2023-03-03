import 'package:flutter/material.dart';
import 'package:flutter_thoitrang/main/layout_main.dart';
import 'package:hive/hive.dart';

final rootNavKey = GlobalKey<NavigatorState>();
final homeShellNavKey = GlobalKey<NavigatorState>();

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void dispose() {
    Hive.box('CartBox').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Thời trang',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xffFF7465),
        fontFamily: 'UTMAvo',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xff333333)),
        ),
      ),
    );
  }
}
