import 'package:flutter/material.dart';

class DefaultTextStyles {
  static TextStyle popUpStyle(
      {Color color = Colors.black, bool isBold = false}) {
    return TextStyle(
        color: color,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: 16,
        fontFamily: 'Segoe UI');
  }
}
