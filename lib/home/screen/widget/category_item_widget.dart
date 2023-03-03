import 'package:flutter/material.dart';

import '../../model/category_model.dart';

class CategoryItemWidget extends StatefulWidget {
  const CategoryItemWidget({Key? key, required this.model}) : super(key: key);

  final CategoryModel model;

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(widget.model.photo), fit: BoxFit.cover),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.model.namevi,
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
}
