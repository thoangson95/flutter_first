import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/forgot_password_screen.dart';

GoRoute forgotPasswordRoute(GlobalKey<NavigatorState> key) {
  return GoRoute(
    path: "/forgot-password",
    parentNavigatorKey: key,
    pageBuilder: (context, state) =>
        const MaterialPage(child: ForgotPasswordScreen()),
  );
}
