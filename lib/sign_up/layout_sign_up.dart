import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/sign_up_screen.dart';

GoRoute signUpRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/sign-up",
    parentNavigatorKey: key,
    pageBuilder: (context, state) => const MaterialPage(child: SignUpScreen()),
  );
}
