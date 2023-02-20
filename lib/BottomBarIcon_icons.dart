// Place fonts/BottomBarIcon.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: BottomBarIcon
//      fonts:
//       - asset: fonts/BottomBarIcon.ttf
import 'package:flutter/widgets.dart';

class BottomBarIcon {
  BottomBarIcon._();

  static const String _fontFamily = 'BottomBarIcons';

  static const IconData bell = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData heart = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData home = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData user = IconData(0xe903, fontFamily: _fontFamily);
}
