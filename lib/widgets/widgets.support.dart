import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }
  static TextStyle SemiboldTextFieldStyle() {
    // final double? fontsize;
    return const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }
  static TextStyle TextFieldStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }

  static TextStyle LightTextFieldStyle() {
    return const TextStyle(
        color: Colors.black54,
        fontSize: 13,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }
  static TextStyle MaxTextFieldStyle() {
    return const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins');
  }
}
