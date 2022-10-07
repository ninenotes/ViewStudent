import 'package:flutter/material.dart';

class Myconstant {
  static Color primary = Color.fromARGB(255, 240, 183, 202);
  static Color dark = Colors.black;

  BoxDecoration bgBOX() => BoxDecoration(
        color: primary,
      );

  TextStyle h1Style() => TextStyle(
        fontSize: 36,
        color: dark,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w500,
      );

  TextStyle h2whiteStyle() => const TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      );

  TextStyle h2redStyle() => const TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 218, 31, 31),
        fontWeight: FontWeight.w500,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );

  Widget titleHx1(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
}
