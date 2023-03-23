import 'package:flutter/material.dart';

class MyStyle {
  // secondary buttons
  ButtonStyle elevatedButtonSecondary = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: const Color.fromARGB(137, 204, 204, 204));

  // primary buttons
  ButtonStyle elevatedButtonPrimary = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: const Color.fromARGB(255, 76, 99, 250));

  // text style
  TextStyle boldHeading =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  // text style
  TextStyle serviceTile = const TextStyle(fontSize: 20, color: Colors.white);
}
