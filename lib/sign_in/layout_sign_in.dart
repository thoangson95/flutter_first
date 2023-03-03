import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/sign_in_screen.dart';

GoRoute signInRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/sign-in",
    parentNavigatorKey: key,
    pageBuilder: (context, state) => const MaterialPage(child: SignInScreen()),
  );
}
