import 'package:flutter/material.dart';
import 'package:another_xlider/another_xlider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Filterscreen extends StatefulWidget {
  const Filterscreen({Key? key}) : super(key: key);

  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff222222),
            )),
        title: const Text(
          'Lọc sản phẩm',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              height: 23 / 16,
              color: Color(0xff222222)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: Column(
            children: const [
              KhoanGia(),
              Padding(
                padding: EdgeInsets.only(bottom: 38),
                child: StarRating(),
              ),
              FilterCategories(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 37),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              decoration: const BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Xóa",
                  style: TextStyle(
                      fontFamily: "UTMAvo",
                      fontSize: 13,
                      height: 21 / 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFF7465)),
                ),
              ),
            ),
            Container(
              width: 150,
              decoration: const BoxDecoration(
                color: Color(0xffFF7465),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Lọc",
                  style: TextStyle(
                      fontFamily: "UTMAvo",
                      fontSize: 13,
                      height: 21 / 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KhoanGia extends StatefulWidget {
  const KhoanGia({Key? key}) : super(key: key);

  @override
  State<KhoanGia> createState() => _KhoanGiaState();
}

class _KhoanGiaState extends State<KhoanGia> {
  double _minValue = 100;
  double _maxValue = 800;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Khoảng giá",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                height: 21 / 14,
                color: Colors.black,
              ),
            ),
            Text(
              '${_minValue}K ~ ${_maxValue}K',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                height: 21 / 14,
                color: Colors.black,
              ),
            )
          ],
        ),
        FlutterSlider(
          values: [_minValue, _maxValue],
          rangeSlider: true,
          max: 1600,
          min: 0,
          tooltip: FlutterSliderTooltip(disabled: true),
          handler: FlutterSliderHandler(
              decoration: const BoxDecoration(
                color: Color(0x000000ff),
              ),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: const FaIcon(
                  FontAwesomeIcons.circle,
                  color: Color(0xffFF7465),
                  size: 22,
                ),
              )),
          rightHandler: FlutterSliderHandler(
              decoration: const BoxDecoration(
                color: Color(0x000000ff),
              ),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: const FaIcon(
                  FontAwesomeIcons.circle,
                  color: Color(0xffFF7465),
                  size: 22,
                ),
              )),
          selectByTap: true,
          trackBar: const FlutterSliderTrackBar(
              activeTrackBar: BoxDecoration(
                color: Color(0xffFF7465),
              ),
              inactiveTrackBar: BoxDecoration(
                color: Color(0xffD9D9D9),
              )),
          step: const FlutterSliderStep(step: 50),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            _minValue = lowerValue;
            _maxValue = upperValue;
            setState(() {});
          },
        )
      ],
    );
  }
}

class StarRating extends StatefulWidget {
  const StarRating({Key? key}) : super(key: key);

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: const Text(
                  "Đáng giá",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    height: 21 / 14,
                    color: Colors.black,
                  ),
                ),
              ),
              RatingBar(
                initialRating: 4,
                allowHalfRating: false,
                itemPadding: const EdgeInsets.only(right: 28),
                direction: Axis.horizontal,
                ratingWidget: RatingWidget(
                  empty: Image.asset(
                    "assets/filter_icon/star_empty.png",
                    width: 32,
                    height: 31,
                    fit: BoxFit.contain,
                  ),
                  half: Image.asset(
                    "assets/filter_icon/star.png",
                    width: 32,
                    height: 31,
                    fit: BoxFit.contain,
                  ),
                  full: Image.asset(
                    "assets/filter_icon/star.png",
                    width: 32,
                    height: 31,
                    fit: BoxFit.contain,
                  ),
                ),
                onRatingUpdate: (value) {},
              )
            ],
          ),
        ),
      ],
    );
  }
}

class FilterCategories extends StatefulWidget {
  const FilterCategories({Key? key}) : super(key: key);

  @override
  State<FilterCategories> createState() => _FilterCategoriesState();
}

class _FilterCategoriesState extends State<FilterCategories> {
  final List<String> _listItem = [
    "Áo khoác",
    "Jumpsuit",
    "Crop top",
    "Áo lệch vai"
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
