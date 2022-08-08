import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../pages/next_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 300,
        splash: Column(
          children: [
            Expanded(child: Image.asset('assets/logo.png')),
            const Text(
              'EcuaTrading12',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
          ],
        ),
        backgroundColor: Colors.blueGrey,
        nextScreen: const NextPage());
  }
}
