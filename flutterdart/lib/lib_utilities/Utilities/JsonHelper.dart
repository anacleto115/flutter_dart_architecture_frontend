
import 'dart:convert';

class JsonHelper
{
  static String convertToString(Map<String, dynamic> data)
  {
    return json.encode(data);
  }

  static Map<String,dynamic> convertToObject(String data)
  {
    return json.decode(data);
  }
}