import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:islami_app/intro/intro_view.dart';
import 'package:islami_app/splash/HomeView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  static const String routeName = '/splash';

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
        _navigateToNext();
      }
    });
  }

  void _navigateToNext() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isFirstTime = prefs.getBool('is_first_time') ?? true;

    if (mounted) {
      if (isFirstTime) {
        Navigator.pushReplacementNamed(context, IntroView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      }
    }
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
