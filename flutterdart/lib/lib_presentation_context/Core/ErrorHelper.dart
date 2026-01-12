// ignore_for_file: curly_braces_in_flow_control_structures
import '../../lib_language/Bundle.dart';

class ErrorHelper
{
  static String getMessage(String key)
  {
    String response = Bundle.get("RsMessages", key);
    if (response == null ||
        response == "")
      return Bundle.get("RsMessages", "lbTryAgain");
    return response;
  }
}