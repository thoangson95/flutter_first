import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TabBar(
            indicatorColor: Color(0xFFFF7465),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 1),
              insets: EdgeInsets.symmetric(horizontal: 30),
            ),
            labelColor: Color(0xFF222222),
            labelStyle: TextStyle(
              fontSize: 13,
              height: 1.3,
              fontWeight: FontWeight.w700,
            ),
            tabs: [
              Tab(
                text: "Home",
              ),
              Tab(
                text: "Categories",
              )
            ],
          ),
          SizedBox(
            height: 96 * 4 + 25 * 4,
            child: TabBarView(children: [
              const Center(
                child: Text("home"),
              ),
              Center(
                child: ListCategories(),
              ),
            ]),
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
    return ListView(
      children: cateList.map((e) {
        return item(e.url, e.name);
      }).toList(),
    );
  }
}
