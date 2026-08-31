import 'package:flutter/material.dart';

mySnackBar(String message, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 1500),
      backgroundColor: Colors.black,
      content: Text(
        textAlign: TextAlign.center,
        message,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    ),
  );
}
