import 'package:flutter/material.dart';

import '../../main.dart';
import '../categories/categories_item.dart';

class TemplateCatagories extends StatefulWidget {
  final int currentIndex;
  const TemplateCatagories({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<TemplateCatagories> createState() => _TemplateCatagoriesState();
}

class _TemplateCatagoriesState extends State<TemplateCatagories> {
  final List<String> imageList = [
    "assets/images/slide.png",
  ];

  List<Widget> generateImages() {
    return imageList
        .map(
          (e) => ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              e,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.currentIndex == 1,
      maintainState: true,
      child: Column(
        children: categoriesLists
            .map((item) => CategoriesItem(item.id, item.name, item.image))
            .toList(),
      ),
    );
  }
}
