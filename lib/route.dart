import 'package:flutter/material.dart';

class NavigationHelper {
  // Push to a new screen
  static void push(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  //  Pus with name Route
  static void pushNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  // Repalce current screen
  static void pushReplacement(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  //  Pop the current screen
  static void pop(BuildContext context, {dynamic result}) {
    Navigator.pop(context, result);
  }

  //  Push and remove all previous screens
  static void pushAndRemoveUntil(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }
}
