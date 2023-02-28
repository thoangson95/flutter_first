import 'package:intl/intl.dart';

String formatCurrency(int amount) {
  final formatter = NumberFormat('#,### đ', 'en_US');
  return formatter.format(amount);
}
