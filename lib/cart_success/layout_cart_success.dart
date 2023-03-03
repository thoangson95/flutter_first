import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/cart_success_screen.dart';

GoRoute cartSuccessRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/cart-success",
    parentNavigatorKey: key,
    pageBuilder: (context, state) =>
        const MaterialPage(child: CartSuccessScreen()),
  );
}
