import 'package:gym8/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      );

  // static final BottomNavigationBarTheme

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
    ),
    chipTheme: const ChipThemeData(
      color: MaterialStatePropertyAll(
        AppPallete.backgroundColor,
      ),
      side: BorderSide.none,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(480, 24),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 32,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 16.0,
      ),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.borderWhiteColor),
      errorBorder: _border(AppPallete.errorColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppPallete.backgroundColor,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 9, 9, 10),
      surfaceTintColor: AppPallete.transparentColor,
      overlayColor: MaterialStatePropertyAll(AppPallete.transparentColor),
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      indicatorColor: AppPallete.purpleColor,
      shadowColor: AppPallete.purpleColor,
      elevation: 4,
    ),
    iconTheme: const IconThemeData(
      color: AppPallete.purpleColor,
    ),
    buttonTheme: const ButtonThemeData(
      minWidth: 54,
    ),
  );
}
