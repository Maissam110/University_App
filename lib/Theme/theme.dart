import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0XFF1A1A16),
  scaffoldBackgroundColor: Colors.black,
  secondaryHeaderColor: Colors.black,
  colorScheme: ColorScheme.light(secondary: Colors.white),
);
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0XFFFAFAFA),
  scaffoldBackgroundColor: Color(0xFF54E062),
  secondaryHeaderColor: Colors.white,
  colorScheme: ColorScheme.dark(secondary: Colors.black),
);
