import 'package:flutter/material.dart';

class UHelperFunction {
  UHelperFunction._();

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}