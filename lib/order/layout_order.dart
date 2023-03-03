import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/order_screen.dart';

GoRoute orderRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/order",
    parentNavigatorKey: key,
    pageBuilder: (context, state) => const MaterialPage(child: OrderScreen()),
  );
}
