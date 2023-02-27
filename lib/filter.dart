import 'package:flutter/material.dart';
import 'package:thoitrang/extendcode.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int vote = 0;
  Color maincolor = const Color(0xFFFF7465);
  RangeValues rangevalue = const RangeValues(100, 800);
  int isSelect = -1;

  List Categories = ['Áo khoác', 'Jumpsuit', 'Crop Top', 'Áo lệch vai'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lọc sản phẩm",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Khoảng giá",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${rangevalue.start.toInt()}K ~ ${rangevalue.end.toInt()}K",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: maincolor,
                    thumbColor: Colors.white,
                    trackHeight: 1,
                    inactiveTrackColor: const Color.fromRGBO(217, 217, 217, 1),
                    minThumbSeparation: 20,
                    overlayColor: Colors.transparent,
                    overlappingShapeStrokeColor: Colors.transparent,
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 10),
                    rangeThumbShape: CircleThumbShape(
                        strokeWidth: 2, strokeColor: maincolor),
                  ),
                  child: RangeSlider(
                    min: 0,
                    max: 2000,
                    values: rangevalue,
                    onChanged: (value) {
                      rangevalue = value;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 36, bottom: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Đánh giá",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    for (int i = 1; i < 6; i++) ...{
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        style: IconButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          maximumSize: Size.zero,
                        ),
                        iconSize: 30,
                        onPressed: () {
                          if (vote == i) {
                            vote = 0;
                          } else {
                            vote = i;
                          }
                          setState(() {});
                        },
                        icon: Icon(
                          vote <= i - 1
                              ? Icons.star_border_rounded
                              : Icons.star_rounded,
                          color: const Color.fromRGBO(255, 195, 91, 1),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 16),
                      ),
                    }
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: const Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (int i = 0; i < Categories.length; i++) ...{
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              height: 50,
                              child: TextButton(
                                onPressed: () {
                                  if (isSelect == i) {
                                    isSelect = -1;
                                    setState(() {});
                                  } else {
                                    isSelect = i;
                                    setState(() {});
                                  }
                                },
                                style: ButtonStyle(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  padding: MaterialStateProperty.resolveWith(
                                      (states) => EdgeInsets.zero),
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.transparent),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${Categories[i]}",
                                      style: TextStyle(
                                          color: isSelect == i
                                              ? maincolor
                                              : const Color(0xFF797979),
                                          fontSize: 13),
                                    ),
                                    if (isSelect == i)
                                      Icon(
                                        Icons.check,
                                        color: maincolor,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            CustomPaint(
                              painter: YourCustomPaint(
                                  color: const Color(0xFFD9D9D9),
                                  width: 1,
                                  dashSpace: 4),
                            )
                          }
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 40, right: 40,bottom: 37),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor:maincolor,
                      backgroundColor: const Color(0xFFEFEFEF),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap
                    ),
                    child: Text(
                      "Xóa",
                      style: TextStyle(
                          color: maincolor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: maincolor,
                      foregroundColor: const Color(0xFFEFEFEF),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Lọc",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
