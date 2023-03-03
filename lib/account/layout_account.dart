import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/account_screen.dart';

GoRoute accountRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/account",
    parentNavigatorKey: key,
    pageBuilder: (context, state) => const MaterialPage(child: AccountScreen()),
  );
}
