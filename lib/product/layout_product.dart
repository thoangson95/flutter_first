import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/product_screen.dart';

GoRoute productRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/product",
    parentNavigatorKey: key,
    pageBuilder: (context, state) => const MaterialPage(child: ProductScreen()),
  );
}
