import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 116, 101, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Image.asset(
                'assets/images/logo.png',
                width: 110,
              ),
            ),
            InkWell(
              child: const Text(
                'La Rosa’s',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 26,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              onTap: () => context.go('/account'),
            ),
          ],
        ),
      ),
    );
  }
}
