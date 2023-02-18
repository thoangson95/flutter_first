import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:thoitrang/dangky.dart';
// import 'package:thoitrang/categories.dart';
import 'package:thoitrang/filterscreen.dart';
import 'package:thoitrang/homescreen.dart';

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
          fontFamily: 'UTMAvo'
          // GoogleFonts.robotoCondensedTextTheme(Theme.of(context).textTheme),

          ),
      home: const Filterscreen(),
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
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
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
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFF7465),
        selectedIconTheme: const IconThemeData(size: 15),
        unselectedIconTheme: const IconThemeData(size: 15),
        unselectedItemColor: const Color(0xFFC2C2C2),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart),
            label: "heart",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bell),
            label: "bell",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: "user",
          ),
        ],
      ),
    );
  }
}
