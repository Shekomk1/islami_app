import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/theme_manager.dart';
import 'package:islami_app/splash/SplashView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.themeData,
      title: 'Islami',
      home: SplashView(),
    );
  }
}
