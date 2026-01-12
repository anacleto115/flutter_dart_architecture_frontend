// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_interpolation_to_compose_strings
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: avoid_init_to_null
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../lib_language/Bundle.dart';
import '../../lib_utilities/Utilities/EncodingHelper.dart';

class StateConverters
{
  static String convert(bool value)
  {
    try
    {
      if (value == null)
        return Bundle.get("RsMessages", "lbInactive");
      if (value.toString() == "False" || value.toString() == "false")
        return Bundle.get("RsMessages", "lbInactive");
      return Bundle.get("RsMessages", "lbActive");
    }
    catch (ex)
    {
      return Bundle.get("RsMessages", "lbInactive");
    }
  }
}

class DateConverters
{
  static String convert(DateTime? value)
  {
    try
    {
      if (value == null)
        return "";
      var inputFormat = DateFormat('dd/MM/yyyy');
      return inputFormat.format(value);
    }
    catch (ex)
    {
      return "";
    }
  }
}

class ImageConverters
{
  static Widget convert(String value, [double h = 30, double w = 30])
  {
    try
    {
      if (value == null)
        return Icon(null, size: 15.0);

      var path = "E:\\Languages\\Examples\\FlutterDart\\lib\\flt_persons\\Images\\";
      if (value.contains(".png") || value.contains(".jpg"))
        value = path + value;
      if (!(value.contains(".png") || value.contains(".jpg")))
        value = path + value + ".png";

      if (!File(value).existsSync())
        return Icon(null, size: 15.0);

      return Image(
        height: h,
        width: w,
        image: FileImage(File(value), scale: 1),
      );
    }
    catch (ex)
    {
      return Icon(null, size: 15.0);
    }
  }
}

class ImageBytesConverters
{
  static Widget convert(String value, [double h = 30, double w = 30])
  {
    try
    {
      if (value == null || value.trim() == "")
        return Icon(null, size: 15.0);

      return Image(
        height: h,
        width: w,
        image: MemoryImage(EncodingHelper.to_Bytes(value)),
      );
    }
    catch (ex)
    {
      return Icon(null, size: 15.0);
    }
  }
}

class EnableConverters
{
  static String convert(String value)
  {
    try
    {
      if (value == null)
        return "";
      if (value.toString() == "Mine")
        return Bundle.get("RSLanguage", "lbMyself");
      return Bundle.get("RSLanguage", "lbFriend");
    }
    catch (ex)
    {
      return "";
    }
  }
}