import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/order_detail_screen.dart';

GoRoute orderDetailRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/order-detail",
    parentNavigatorKey: key,
    pageBuilder: (context, state) =>
        const MaterialPage(child: OrderDetailScreen()),
  );
}
