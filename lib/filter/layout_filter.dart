import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/filter_screen.dart';

GoRoute filterRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/filter",
    parentNavigatorKey: key,
    pageBuilder: (context, state) => const MaterialPage(child: FilterScreen()),
  );
}
