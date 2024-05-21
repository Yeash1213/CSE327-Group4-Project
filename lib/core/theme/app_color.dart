import 'package:flutter/material.dart';

class AppColor {
  static Color primaryColor = const Color(0xFF87CEEB);
  static Color secondaryColor = const Color(0xFF81D4FA);
  static Color white = Color.fromARGB(255, 255, 255, 255);
  static Color black = const Color(0xFF000000);
  static Color backgroundBlack = Color.fromARGB(255, 32, 135, 118);
  static Color backgroundGray = Color.fromARGB(255, 17, 183, 202);

  static MaterialColor primarySwatch = const MaterialColor(
    0xFF87CEEB,
    {
      50: Color(0xFFE0F7FA), // lightest
      100: Color(0xFFB3E5FC),
      200: Color(0xFF81D4FA),
      300: Color(0xFF4FC3F7),
      400: Color(0xFF29B6F6),
      500: Color(0xFF03A9F4), // primary
      600: Color(0xFF039BE5),
      700: Color(0xFF0288D1),
      800: Color(0xFF0277BD),
      900: Color(0xFF01579B), // darkest
    },
  );
}
