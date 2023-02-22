import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

class Categories {
  final String name;
  final String image;

  Categories({required this.name, required this.image});
}

final List<Categories> categories = [
  Categories(name: 'Hàng mới về', image: 'assets/images/banner.png'),
  Categories(name: 'Hàng bán chạy', image: 'assets/images/banner1.png'),
  Categories(name: 'Hàng khuyến mãi', image: 'assets/images/banner2.png'),
  Categories(name: 'Áo khoác', image: 'assets/images/banner3.png'),
  Categories(name: 'Đầm', image: 'assets/images/banner1.png'),
  Categories(name: 'Jumpsuit', image: 'assets/images/banner2.png'),
];

List<Widget> categoriesWidgets = categories.map((item) {
  return Container(
    margin: const EdgeInsets.only(bottom: 25),
    child: Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.asset(
            item.image,
            width: 1000,
            height: 95,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          left: 40,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.name,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}).toList();

class TabCategories extends StatelessWidget {
  const TabCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
      child: Column(
        children: categoriesWidgets,
      ),
    );
  }
}
