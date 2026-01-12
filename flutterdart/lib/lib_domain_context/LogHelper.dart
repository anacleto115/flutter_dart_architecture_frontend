// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: avoid_init_to_null
import 'ILogHelper.dart';

class LogHelper
{
  static ILogHelper? iLogHelper = null;

  static void log(dynamic exception, [bool subError = false])
  {
    if (iLogHelper == null)
      return;

    iLogHelper!.log(exception, subError);
  }
}