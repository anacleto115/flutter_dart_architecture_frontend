// ignore_for_file: avoid_init_to_null
import 'package:flutter/material.dart';
import 'DarkStyle.dart';
import 'LightStyle.dart';

class Style
{
  static bool isDark = true;
  static Color? textColor, mainColor, popupColor;
  static Brightness? brightness = null;
  static ColorScheme? appStyle = null;

  // Forms
  static TextStyle? titles = TextStyle(
    fontSize: 22,
    color: textColor,
    fontWeight: FontWeight.bold
  );
  static TextStyle? labels = TextStyle(
      fontSize: 14,
      color: textColor,
  );
  static ButtonStyle? buttons = TextButton.styleFrom(
    backgroundColor: mainColor,
    foregroundColor: textColor,
  );

  static void load()
  {
    brightness = isDark ? DarkStyle.brightness : LightStyle.brightness;
    textColor = isDark ? DarkStyle.textColor : LightStyle.textColor;
    mainColor = isDark ? DarkStyle.mainColor : LightStyle.mainColor;
    appStyle = isDark ? DarkStyle.appStyle : LightStyle.appStyle;
    popupColor = isDark ? DarkStyle.popupColor : LightStyle.popupColor;
  }
}