import 'package:flutter/material.dart';

import '../../models/product.dart';

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
