import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/theme_manager.dart';
import 'package:islami_app/intro/intro_view.dart';
import 'package:islami_app/quran/widgets/quran_details_view.dart';
import 'package:islami_app/splash/HomeView.dart';
import 'package:islami_app/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        SplashView.routeName: (context) => SplashView(),
        IntroView.routeName: (context) => IntroView(),
        HomeView.routeName: (context) => HomeView(),
        QuranDetailsView.routName: (context) => QuranDetailsView(),
      },

      // home: SplashView(),
    );
  }
}
