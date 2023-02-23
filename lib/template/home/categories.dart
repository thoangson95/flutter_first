import 'package:flutter/material.dart';
import 'package:thoitrang/controller/category_controller.dart';
import 'package:thoitrang/model/category_model.dart';

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

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return const ListCategories();
  }
}

class CategoryItem {
  String url;
  String name;
  CategoryItem({required this.url, required this.name});
}

class ListCategories extends StatefulWidget {
  const ListCategories({Key? key}) : super(key: key);

  @override
  State<ListCategories> createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {
  late Future<List<Category>> listCate;
  @override
  void initState() {
    listCate = fetchListCategory();
    super.initState();
  }

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
    return FutureBuilder(
      future: listCate,
      builder: (context, snapshot) {
        List<Widget> children = [];
        if (snapshot.hasData) {
          children = snapshot.data!
              .take(20)
              .map((e) => item(e.image, e.name))
              .toList();
        } else if (snapshot.hasData) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: children,
        );
      },
    );
  }
}
