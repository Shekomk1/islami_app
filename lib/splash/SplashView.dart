import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:islami_app/intro/intro_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  int index = 0;

  final List<String> splashImages = [
    'assets/images/Splash/Splash_Screen1.png',
    'assets/images/Splash/Splash_Screen2.png',
  ];

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (index < splashImages.length - 1) {
        setState(() => index++);
      } else {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const IntroView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        splashImages[index],
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
