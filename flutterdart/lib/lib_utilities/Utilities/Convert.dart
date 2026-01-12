// ignore_for_file: file_names
// ignore_for_file: prefer_interpolation_to_compose_strings
// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:intl/intl.dart';

class Convert
{
  static String dateToString(DateTime? value)
  {
    try
    {
      if (value == null)
        return "";
      var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      return inputFormat.format(value);
    }
    catch (ex)
    {
      return "";
    }
  }

  static DateTime? stringToDate(String value)
  {
    try
    {
      if (value == null)
        return null;
      var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      return inputFormat.parse(value);
    }
    catch (ex)
    {
      return null;
    }
  }

  static DateTime? serviceToDate(String value)
  {
    try
    {
      if (value == null)
        return null;
      value = value.replaceAll("T", " ").replaceAll("Z", "");
      var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      return inputFormat.parse(value);
    }
    catch (ex)
    {
      return null;
    }
  }
}