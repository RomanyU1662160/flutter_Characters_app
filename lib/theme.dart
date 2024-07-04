import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color.fromRGBO(249, 111, 111, 1);
  static Color primaryAccent = const Color.fromRGBO(247, 6, 6, 0.976);
  static Color secondaryColor = const Color.fromRGBO(45, 45, 45, 1);
  static Color secondaryAccent = const Color.fromRGBO(35, 35, 35, 1);
  static Color titleColor = const Color.fromRGBO(238, 133, 133, 1);
  static Color textColor = const Color.fromRGBO(177, 176, 176, 1);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromRGBO(212, 172, 13, 1);
}

ThemeData primaryTheme = ThemeData(
    // seed color
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

    //scaffold color
    scaffoldBackgroundColor: AppColors.secondaryAccent,

    // app bar theme
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.secondaryColor,
        foregroundColor: AppColors.textColor,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 25,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold)),

    // Text Theme
    // copyWith similar to JS object copy and override, copy default flutter theme and override values below
    textTheme: const TextTheme().copyWith(
        bodyMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 16,
          letterSpacing: 1,
        ),
        headlineMedium: TextStyle(
          color: AppColors.textColor,
          fontSize: 22,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: AppColors.highlightColor,
          fontSize: 18,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
            color: AppColors.highlightColor, fontSize: 22, letterSpacing: 2)),

    // Card Theme
    cardTheme: CardTheme(
        color: AppColors.secondaryAccent.withOpacity(0.5),
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(),
        shadowColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 16)),

    // inputs theme
    inputDecorationTheme: InputDecorationTheme(
      activeIndicatorBorder: BorderSide(color: AppColors.textColor, width: 0.8),
      border: InputBorder.none,
      filled: true,
      fillColor: AppColors.secondaryColor.withOpacity(0.5),
      labelStyle: TextStyle(color: AppColors.textColor),
      prefixIconColor: AppColors.highlightColor,
      //
    ));
