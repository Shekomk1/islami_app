import 'package:flutter/material.dart';
import 'package:islami_app/core/theme/color_pallet.dart';

abstract class ThemeManager {
  static ThemeData themeData = ThemeData(
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorPallete.primaryColor),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorPallete.primaryColor,
        )
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontFamily: 'Janna',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: ColorPallete.generalTextColor,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Janna',
        fontSize: 16,
        color: ColorPallete.generalTextColor,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Janna',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorPallete.generalTextColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Janna',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorPallete.generalTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Janna',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: ColorPallete.generalTextColor,
      ),
    ),

    primaryColor: ColorPallete.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorPallete.primaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      selectedLabelStyle: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      unselectedItemColor: Colors.black,
      unselectedLabelStyle: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
