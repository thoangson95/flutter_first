import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

import 'widget/home_search_widget.dart';
import 'widget/home_wellcome_widget.dart';
import 'widget/tab/home/home_product_widget.dart';
import 'widget/tab/categories/home_categories_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isVisibleTab1 = true;
  bool _isVisibleTab2 = false;

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
      _isVisibleTab1 = _currentIndex == 0;
      _isVisibleTab2 = _currentIndex == 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GFAppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/home.png',
              fit: BoxFit.contain,
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(14),
              child: const Text(
                'La Rosa’s',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/icons/bag.png',
              width: 20,
            ),
            onPressed: () => context.go('/home'),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          const HomeWellcomeWidget(),
          const HomeSearchWidget(),
          DefaultTabController(
            length: 2,
            child: TabBar(
              labelColor: const Color.fromRGBO(34, 34, 34, 1),
              labelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'UTMAvo',
              ),
              unselectedLabelColor: const Color.fromRGBO(34, 34, 34, 1),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2.0,
                  color: Color.fromRGBO(255, 116, 101, 1),
                ),
                borderRadius: BorderRadius.zero,
              ),
              onTap: (index) {
                setState(() {
                  _onTabChanged(index);
                });
              },
              tabs: const [
                Tab(text: ' Home '),
                Tab(text: ' Categories '),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            child: IndexedStack(
              index: _currentIndex,
              children: [
                Visibility(
                  visible: _isVisibleTab1,
                  child: const HomeProductWidget(),
                ),
                Visibility(
                  visible: _isVisibleTab2,
                  child: const HomeCategoriesWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
