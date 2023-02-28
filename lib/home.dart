import 'package:flutter/material.dart';
import 'package:thoitrang/icons/AppFonts_icons.dart';
import 'templates/home/page_home.dart';
import 'templates/user/page_user.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  late int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    // SearchScreen(),
    const UserPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedIconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
            ),
            iconSize: 26,
            unselectedIconTheme: const IconThemeData(
              color: Color(0xFFC2C2C2),
            ),
            showSelectedLabels: false,
            backgroundColor: Colors.red,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(AppFonts.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppFonts.heart),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppFonts.bell),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppFonts.user),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
