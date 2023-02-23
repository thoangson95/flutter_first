import 'package:flutter/material.dart';
import 'package:thoitrang/rangesliderborder.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  int vote = 0;
  Color maincolor = const Color(0xFFFF7465);
  double start = 100;
  double end = 800;

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
                        "${start.toInt()}K ~ ${end.toInt()}K",
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
                    values: RangeValues(start, end),
                    onChanged: (value) {
                      start = value.start;
                      end = value.end;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 36,bottom: 22),
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
                          for (int i = 0; i < 100; i++)
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              color: Colors.black,
                              child: Text("$i"),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
