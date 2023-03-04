import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/verification_code_screen.dart';

class LayoutVerificationCode extends StatelessWidget {
  const LayoutVerificationCode({super.key});

  static String pathRoute = 'verification-code';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) {
          return const VerificationCodeScreen();
        },
      );

  @override
  Widget build(BuildContext context) {
    return const VerificationCodeScreen();
  }
}
