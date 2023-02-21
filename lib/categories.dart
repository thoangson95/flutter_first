import 'package:flutter/material.dart';
import 'package:slide_indexed_stack/slide_indexed_stack.dart';
import 'hometab.dart';

class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
  const DecoratedTabBar(
      {super.key, required this.tabBar, required this.decoration});

  final TabBar tabBar;
  final BoxDecoration decoration;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(decoration: decoration)),
        tabBar,
      ],
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;
  late int _selected_index;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
    _selected_index = _tabCtrl.index;
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: DecoratedTabBar(
              tabBar: TabBar(
                indicatorColor: const Color(0xFFFF7465),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xFFFF7465),
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 30),
                ),
                labelColor: const Color(0xFF222222),
                labelStyle: const TextStyle(
                  fontSize: 13,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                ),
                controller: _tabCtrl,
                onTap: (value) {
                  setState(() {
                    _selected_index = value;
                  });
                },
                tabs: const [
                  Tab(
                    text: "Home",
                  ),
                  Tab(
                    text: "Categories",
                  )
                ],
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xffD9D9D9),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          // Tab viewer
          SlideIndexedStack(
            index: _selected_index,
            axis: Axis.horizontal,
            slideOffset: -0.5,
            duration: const Duration(milliseconds: 300),
            children: [
              Hometab(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: ListCategories(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CategoryItem {
  String url;
  String name;
  CategoryItem({required this.url, required this.name});
}

class ListCategories extends StatelessWidget {
  ListCategories({Key? key}) : super(key: key);

  final List cateList = [
    CategoryItem(
        url:
            "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
        name: "Hàng mới về"),
    CategoryItem(
        url:
            "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
        name: "Hàng bán chạy"),
    CategoryItem(
        url:
            "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
        name: "Áo khoác"),
    CategoryItem(
        url:
            "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
        name: "Jump suit"),
    CategoryItem(
        url:
            "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
        name: "Hàng mới về"),
  ];

  Widget item(String url, String name) {
    return Container(
      height: 96,
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                height: 1.5,
                color: Color(0xFFFFFFFF)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cateList.map((e) {
        return item(e.url, e.name);
      }).toList(),
    );
  }
}
