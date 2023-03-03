import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen/product_detail_screen.dart';

class LayoutProductDetail extends StatelessWidget {
  final String id;
  const LayoutProductDetail({super.key, required this.id});

  static String pathRoute = 'product-detail';
  static GoRoute goRoute() => GoRoute(
        path: "$pathRoute/:id",
        builder: (context, state) {
          return ProductDetailScreen(state.params['id'].toString());
        },
      );

  @override
  Widget build(BuildContext context) {
    return ProductDetailScreen(id);
  }
}
