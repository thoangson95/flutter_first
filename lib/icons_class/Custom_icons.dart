// Place fonts/Custom.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: Custom
//      fonts:
//       - asset: fonts/Custom.ttf
import 'package:flutter/widgets.dart';

class Custom {
  Custom._();

  static const String _fontFamily = 'Custom';

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
