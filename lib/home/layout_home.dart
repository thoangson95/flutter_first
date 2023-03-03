import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/home_screen.dart';

GoRoute homeRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/home",
    parentNavigatorKey: key,
    pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
  );
}
