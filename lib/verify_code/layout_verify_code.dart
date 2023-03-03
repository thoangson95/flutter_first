import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/verify_code_screen.dart';

GoRoute verifyCodeRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/verify-code",
    parentNavigatorKey: key,
    pageBuilder: (context, state) =>
        const MaterialPage(child: VerifyCodeScreen()),
  );
}
