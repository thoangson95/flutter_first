import 'package:flutter/material.dart';
import 'account/layout_account.dart';
import 'filter/layout_filter.dart';
import 'products/layout_products.dart';
import 'home/layout_home.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  dynamic modalData;

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    LayoutHome(),
    LayoutProducts(),
    LayoutFilter(),
    LayoutAccount(),
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
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
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
