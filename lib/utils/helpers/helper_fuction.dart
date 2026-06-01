import 'package:flutter/material.dart';

class UHelperFunction {
  UHelperFunction._();

  static Color? getColor(String value) {
    /// Define your product specific colors here and it will match the attribute colors and show specific 🟠🟡🟢🔵🟣🟤

    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Dark Blue') {
      return Colors.blueGrey;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else if (value == 'Silver') {
      return Colors.grey;
    } else {
      return null;
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Function to get greeting message based on current time
  static String getGreetingMessage() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      // 5AM To 12PM - Good Morning
      return 'Good Morning';
    } else if (hour >= 12 && hour < 16) {
      // 12PM TO 4PM - Good Afternoon
      return 'Good Afternoon';
    } else if (hour >= 16 && hour < 19) {
      // 4PM TO 8PM - Good Evening
      return 'Good Evening';
    } else {
      // 8PM TO 5AM - Good Night
      return 'Good Night';
    }
  }
}
