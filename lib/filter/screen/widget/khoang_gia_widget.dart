import 'package:flutter/material.dart';
import 'package:another_xlider/another_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KhoanGiaWidget extends StatefulWidget {
  const KhoanGiaWidget({Key? key}) : super(key: key);

  @override
  State<KhoanGiaWidget> createState() => _KhoanGiaWidgetState();
}

class _KhoanGiaWidgetState extends State<KhoanGiaWidget> {
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
              '${_minValue.round()}K ~ ${_maxValue.round()}K',
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
