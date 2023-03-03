import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/product_detail_screen.dart';

GoRoute producDetailtRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/product-detail",
    parentNavigatorKey: key,
    pageBuilder: (context, state) =>
        const MaterialPage(child: ProductDetailScreen()),
  );
}
