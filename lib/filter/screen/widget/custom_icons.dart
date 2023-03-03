// Place fonts/custom.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//  - family: custom
//    fonts:
//     - asset: fonts/custom.ttf
import 'package:flutter/widgets.dart';

class Custom {
  Custom._();

  static const String _fontFamily = 'custom';

  static const IconData star_solid = IconData(0xe90d, fontFamily: _fontFamily);
  static const IconData star_regular =
      IconData(0xe90e, fontFamily: _fontFamily);
  static const IconData unlock = IconData(0xe909, fontFamily: _fontFamily);
  static const IconData eye = IconData(0xe90a, fontFamily: _fontFamily);
  static const IconData phone = IconData(0xe90b, fontFamily: _fontFamily);
  static const IconData mail = IconData(0xe90c, fontFamily: _fontFamily);
  static const IconData location = IconData(0xe907, fontFamily: _fontFamily);
  static const IconData ben = IconData(0xe908, fontFamily: _fontFamily);
  static const IconData bag = IconData(0xe906, fontFamily: _fontFamily);
  static const IconData filter = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData sort = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData bell = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData heart = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData home = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData user = IconData(0xe903, fontFamily: _fontFamily);
}
