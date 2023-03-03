import 'package:flutter/material.dart';
import 'package:flutter_thoitrang/cart/screen/cart_screen.dart';
import 'package:go_router/go_router.dart';

GoRoute cartRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/cart",
    parentNavigatorKey: key,
    pageBuilder: (context, state) => const MaterialPage(child: CartScreen()),
  );
}
