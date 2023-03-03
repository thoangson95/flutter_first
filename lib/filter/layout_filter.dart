import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen/filter_screen.dart';

class LayoutFilter extends StatelessWidget {
  const LayoutFilter({super.key});

  static String pathRoute = 'filter';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) {
          return const FilterScreen();
        },
      );

  @override
  Widget build(BuildContext context) {
    return const FilterScreen();
  }
}
