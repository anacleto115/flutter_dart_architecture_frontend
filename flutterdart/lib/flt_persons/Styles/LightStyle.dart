
import 'package:flutter/material.dart';

class LightStyle
{
  static Brightness brightness = Brightness.light;
  static Color textColor = Colors.black,
      mainColor = Colors.indigoAccent,
      popupColor = Colors.white;
  static ColorScheme appStyle = ColorScheme.fromSeed(
      seedColor: mainColor!,
      brightness: brightness!
  );
}