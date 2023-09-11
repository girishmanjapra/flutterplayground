import 'package:flutter/material.dart';

class AppTheme {
  // Color declarations starts here
  static Color appBarColor = const Color(0xFF18191C);
  static Color tacklBlack = const Color(0xFF1d1d24);
  static const appBgColor = Color.fromARGB(255, 9, 9, 9);
  static const mainBlackCo = Color(0xFF18191C);
  static const secondaryColor = Color(0xFF777BD1);
  static const blackColor = Color.fromARGB(255, 11, 11, 11);
  static const normalWhite = Color(0xFFFFF1E4);
  static const blueWhite = Color(0xFF6E7191);
  // Color declarations ends here

  static const TextStyle appBarTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle styleRadioButtonText = TextStyle(
      color: AppTheme.blueWhite, fontWeight: FontWeight.w600, fontSize: 20);
}
