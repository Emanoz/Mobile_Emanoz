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

  static TextStyle appbarStyle() {
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontFamily: 'Segoe UI');
  }

  static TextStyle cardStyle() {
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 18,
        fontFamily: 'Segoe UI');
  }

  static TextStyle cardTitleStyle() {
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        fontFamily: 'Segoe UI');
  }

  static TextStyle cardSubtitleStyle() {
    return TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.normal,
      fontSize: 14,
      fontFamily: 'Segoe UI',
    );
  }

  static TextStyle cardButtonStyle({Color color}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        fontFamily: 'Segoe UI');
  }
}
