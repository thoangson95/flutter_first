import 'dart:ui';

import 'package:intl/intl.dart';

String formatCurrency(int amount) {
  final formatter = NumberFormat('#,### đ', 'en_US');
  return formatter.format(amount);
}

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse(hexCode, radix: 16));
}
