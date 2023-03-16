import 'package:flutter/material.dart';
import 'package:flutter/src/painting/gradient.dart';

class Myconstant {
  static String urlImage = '';
  static Color primary = Color.fromARGB(212, 50, 223, 253);

  static Color dark = Color.fromARGB(255, 0, 0, 0);

  static Color primaryColorLight = Color(0xFFf85187);
  static Color primaryLightColorLight = Color(0xFF3ac3cb);

  static const mainGradientLight =
      LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Color(0xFFf85187), Color(0xFF3ac3cb)]);

  BoxDecoration bgBOX() => BoxDecoration(
      //color: primary,

      gradient: mainGradientLight);

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
       TextStyle h3whiteStyle() => const TextStyle(
        fontSize: 20,
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
