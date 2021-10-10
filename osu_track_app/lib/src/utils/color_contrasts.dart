import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor pink = MaterialColor(
    0xffad366d, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff9c3162),//10%
      100: Color(0xff8a2b57),//20%
      200: Color(0xff79264c),//30%
      300: Color(0xff682041),//40%
      400: Color(0xff571b37),//50%
      500: Color(0xff45162c),//60%
      600: Color(0xff341021),//70%
      700: Color(0xff230b16),//80%
      800: Color(0xff11050b),//90%
      900: Color(0xff000000),//100%
    },
  );
  static const MaterialColor purple = MaterialColor(
    0xff2a243a, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff262034),//10%
      100: Color(0xff221d2e),//20%
      200: Color(0xff1d1929),//30%
      300: Color(0xff191623),//40%
      400: Color(0xff15121d),//50%
      500: Color(0xff110e17),//60%
      600: Color(0xff0d0b11),//70%
      700: Color(0xff08070c),//80%
      800: Color(0xff040406),//90%
      900: Color(0xff000000),//100%
    },
  );
  static const MaterialColor brown = MaterialColor(
    0xff3D2F2F, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff3d2f2f),//10%
      100: Color(0xff261d1d),//20%
      200: Color(0xff221919),//30%
      300: Color(0xff1d1616),//40%
      400: Color(0xff181212),//50%
      500: Color(0xff130e0e),//60%
      600: Color(0xff0e0b0b),//70%
      700: Color(0xff0a0707),//80%
      800: Color(0xff050404),//90%
      900: Color(0xff000000),//100%
    },
  );
}



