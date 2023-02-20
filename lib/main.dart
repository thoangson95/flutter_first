import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:thoitrang/dangky.dart';
// import 'package:thoitrang/categories.dart';
import 'package:thoitrang/filterscreen.dart';
import 'package:thoitrang/homescreen.dart';
import 'BottomBarIcon_icons.dart';

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
      debugShowMaterialGrid: false,
      theme: ThemeData(
        // useMaterial3: true,
        fontFamily: 'UTMAvo',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          const Homescreen(),
          const Filterscreen(),
          const Dangky(),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFFFF7465),
          unselectedItemColor: const Color(0xFFC2C2C2),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                BottomBarIcon.home,
                size: 24,
              ),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                BottomBarIcon.heart,
                size: 24,
              ),
              label: "heart",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                BottomBarIcon.bell,
                size: 24,
              ),
              label: "bell",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                BottomBarIcon.user,
                size: 24,
              ),
              label: "user",
            ),
          ],
        ),
      ),
    );
  }
}
