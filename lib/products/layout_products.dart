import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen/products_screen.dart';

class LayoutProducts extends StatelessWidget {
  const LayoutProducts({super.key});

  static String pathRoute = 'products';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) {
          return const ProductsScreen();
        },
      );

  @override
  Widget build(BuildContext context) {
    return const ProductsScreen();
  }
}
