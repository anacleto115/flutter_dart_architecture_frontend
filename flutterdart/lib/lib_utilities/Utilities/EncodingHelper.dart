// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:typed_data';

class EncodingHelper
{
  static String to_String(Uint8List data)
  {
    return base64.encode(data);
  }

  static Uint8List to_Bytes(String data)
  {
    return base64.decode(data);
  }
}