import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen/account_screen.dart';

class LayoutAccount extends StatelessWidget {
  const LayoutAccount({super.key});

  static String pathRoute = 'account';
  static GoRoute goRoute() => GoRoute(
        path: pathRoute,
        builder: (context, state) {
          return const AccountScreen();
        },
      );

  @override
  Widget build(BuildContext context) {
    return const AccountScreen();
  }
}
