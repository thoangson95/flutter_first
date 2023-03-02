import 'package:flutter/material.dart';
import '../../icons/AppFonts_icons.dart';
import '../../user/screen/user_screen.dart';
import 'widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeWidget(),
    // const FavoritePage(),
    const UserPage(),
  ];

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
