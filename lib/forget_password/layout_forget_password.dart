import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen/forget_password_screen.dart';

class LayoutForgetPassword extends StatelessWidget {
  const LayoutForgetPassword({super.key});

  static String pathRoute = 'forget-password';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) {
          return const ForgetPasswordScreen();
        },
      );

  @override
  Widget build(BuildContext context) {
    return const ForgetPasswordScreen();
  }
}
