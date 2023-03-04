import 'package:flutter/material.dart';

class CircleThumbShape extends RoundRangeSliderThumbShape {
  final double thumbRadius;
  final double strokeWidth;
  final Color strokeColor;

  const CircleThumbShape(
      {this.thumbRadius = 9,
      this.strokeColor = Colors.black,
      this.strokeWidth = 0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool? isOnTop,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    final Size thumbSize =
        sliderTheme.rangeThumbShape!.getPreferredSize(isEnabled, isDiscrete);
    final double thumbRadius = thumbSize.width / 2;
    final Canvas canvas = context.canvas;

    final fillPaint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = const Color(0xFFFF7465)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, thumbRadius, fillPaint);
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}

class YourCustomPaint extends CustomPainter {
  final Color color;
  final double width;
  final int dashSpace;
  final int dashWidth;

  YourCustomPaint(
    {
      required this.color,
      required this.width,
      this.dashSpace = 4,
      this.dashWidth = 4
    }
  );

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawDashedLine(Canvas canvas, Size size, Paint paint) {

    // Start to draw from left size.
    // Of course, you can change it to match your requirement.
    double startX = 0;
    double y = 0;

    // Repeat drawing until we reach the right edge.
    // In our example, size.with = 300 (from the SizedBox)
    while (startX < size.width) {
      // Draw a small line.
      canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);

      // Update the starting X
      startX += dashWidth + dashSpace;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.square
      ..strokeWidth = width;

    _drawDashedLine(canvas, size, paint);
  }
}