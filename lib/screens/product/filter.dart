import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:custom_check_box/custom_check_box.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _currentRangeValues = const RangeValues(100, 800);

  List<Map<String, dynamic>> items = [
    {
      'title': 'Áo khoác',
      'value': false,
      'onChanged': (newValue) {},
    },
    {
      'title': 'Jumpsuit',
      'value': true,
      'onChanged': (newValue) {},
    },
    {
      'title': 'Crop Top',
      'value': true,
      'onChanged': (newValue) {},
    },
    {
      'title': 'Áo lệch vai',
      'value': false,
      'onChanged': (newValue) {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        centerTitle: true,
        title: const Text(
          'Lọc sản phẩm',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GFIconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => context.go('/products'),
          type: GFButtonType.transparent,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              children: <Widget>[
                const Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    'Khoảng giá',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromRGBO(34, 34, 34, 1),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${_currentRangeValues.start.round()}K',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromRGBO(34, 34, 34, 1),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color.fromRGBO(34, 34, 34, 1),
                          ),
                        ),
                      ),
                      Text(
                        '${_currentRangeValues.end.round()}K',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromRGBO(34, 34, 34, 1),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: RangeSlider(
              inactiveColor: const Color.fromRGBO(217, 217, 217, 1),
              activeColor: const Color.fromRGBO(255, 116, 101, 1),
              values: _currentRangeValues,
              max: 1000,
              divisions: 100,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              children: const <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    'Đánh giá',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromRGBO(34, 34, 34, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: RatingBar(
              initialRating: 4,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 45,
              ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star_rate_rounded,
                  color: Color.fromRGBO(255, 195, 91, 1),
                ),
                half: const Icon(
                  Icons.star_half_rounded,
                  color: Color.fromRGBO(255, 195, 91, 1),
                ),
                empty: const Icon(
                  Icons.star_border_rounded,
                  color: Color.fromRGBO(255, 195, 91, 1),
                ),
              ),
              onRatingUpdate: (value) {},
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              children: const <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color.fromRGBO(34, 34, 34, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          items[index]['title'],
                          style: const TextStyle(fontSize: 13),
                        ),
                        CustomCheckBox(
                          value: items[index]['value'],
                          shouldShowBorder: true,
                          borderColor: Colors.transparent,
                          checkedFillColor: Colors.transparent,
                          checkedIconColor: Colors.red,
                          borderRadius: 100,
                          borderWidth: 0,
                          checkBoxSize: 20,
                          onChanged: (val) {},
                        ),
                      ],
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[200],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 7.5),
                child: Material(
                  color: const Color.fromRGBO(239, 239, 239, 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: InkWell(
                    onTap: () => context.go('/order-success'),
                    child: const SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Xóa',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color.fromRGBO(255, 116, 101, 1)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 7.5),
                child: Material(
                  color: const Color.fromRGBO(255, 116, 101, 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: InkWell(
                    onTap: () => context.go('/order-success'),
                    child: const SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Lọc',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
