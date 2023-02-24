import 'package:flutter/material.dart';
import 'package:thoitrang/screens/account/account.dart';
import 'package:thoitrang/screens/home/home.dart';
import 'package:thoitrang/screens/product/products.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProductsScreen(),
    HomeScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/images/icons/tab/home.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'assets/images/icons/tab/home_active.png',
        width: 24,
        height: 24,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/images/icons/tab/favorite.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'assets/images/icons/tab/favorite_active.png',
        width: 24,
        height: 24,
      ),
      label: 'Favorite',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/images/icons/tab/notifications.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'assets/images/icons/tab/notifications_active.png',
        width: 24,
        height: 24,
      ),
      label: 'Notifications',
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        'assets/images/icons/tab/user.png',
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        'assets/images/icons/tab/user_active.png',
        width: 24,
        height: 24,
      ),
      label: 'Account',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(-3, 0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: _navItems,
          ),
        ),
      ),
    );
  }
}
