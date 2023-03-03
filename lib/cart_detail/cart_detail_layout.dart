import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/cart_detail_screen.dart';

GoRoute cartDetailRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/cart-detail",
    parentNavigatorKey: key,
    pageBuilder: (context, state) =>
        const MaterialPage(child: CartDetailScreen()),
  );
}
