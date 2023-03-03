import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'custom_icons.dart';

class MainBottomNavBarWidget extends StatefulWidget {
  const MainBottomNavBarWidget({Key? key, required this.body})
      : super(key: key);

  final Widget body;

  @override
  State<MainBottomNavBarWidget> createState() => _MainBottomNavBarWidgetState();
}

class _MainBottomNavBarWidgetState extends State<MainBottomNavBarWidget> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value != currentIndex) {
            switch (value) {
              case 0:
                context.go('/home');
                setState(() {
                  currentIndex = value;
                });
                break;
              case 1:
                context.go('/home');
                setState(() {
                  currentIndex = value;
                });
                break;
              case 2:
                context.go('/home');
                setState(() {
                  currentIndex = value;
                });
                break;
              case 3:
                context.go('/account');
                setState(() {
                  currentIndex = value;
                });
                break;
            }
          }
        },
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        currentIndex: currentIndex,
        selectedIconTheme: const IconThemeData(color: Color(0xffFF7465)),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Custom.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Custom.heart), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Custom.bell), label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Custom.user), label: "Account"),
        ],
      ),
    );
  }
}
