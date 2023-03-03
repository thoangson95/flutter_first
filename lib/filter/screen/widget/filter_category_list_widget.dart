import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterCategoryListWidget extends StatefulWidget {
  const FilterCategoryListWidget({Key? key}) : super(key: key);

  @override
  State<FilterCategoryListWidget> createState() =>
      _FilterCategoryListWidgetState();
}

class _FilterCategoryListWidgetState extends State<FilterCategoryListWidget> {
  final List<String> _listItem = [
    "Áo khoác",
    "Jumpsuit",
    "Crop top",
    "Áo lệch vai",
    "Áo khoác",
    "Áo khoác",
    "Áo khoác",
    "Áo khoác",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: const Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    height: 21 / 14,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                  height: 51 * 4,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: _listItem
                        .map((e) => Column(
                              children: [
                                FilterCategoryItem(
                                  name: e,
                                ),
                                const DashedLine(
                                  color: Color(0xffD9D9D9),
                                )
                              ],
                            ))
                        .toList(),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

class FilterCategoryItem extends StatefulWidget {
  const FilterCategoryItem({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<FilterCategoryItem> createState() => _FilterCategoryItemState();
}

class _FilterCategoryItemState extends State<FilterCategoryItem> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: SizedBox(
        height: 50,
        child: ListTile(
          title: Text(
            widget.name,
            style: TextStyle(
                fontSize: 13,
                height: 18 / 13,
                color: _selected
                    ? const Color(0xffFF7465)
                    : const Color(0xff797979)),
          ),
          trailing: _selected
              ? const FaIcon(
                  FontAwesomeIcons.check,
                  color: Color(0xffFF7465),
                )
              : null,
        ),
      ),
    );
  }
}

class DashedLine extends StatelessWidget {
  const DashedLine({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 3.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
