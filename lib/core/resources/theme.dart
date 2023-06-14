import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: Colors.grey,
      filled: true,
      contentPadding: const EdgeInsets.all(12),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.red),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(5),
      ),
      focusColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
