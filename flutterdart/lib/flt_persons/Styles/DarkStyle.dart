
import 'package:flutter/material.dart';

class DarkStyle
{
  static Brightness brightness = Brightness.dark;
  static Color textColor = Colors.white,
      mainColor = Colors.black,
      popupColor = Colors.grey;
  static ColorScheme appStyle = ColorScheme.fromSeed(
      seedColor: textColor!,
      brightness: brightness!,
  );
}