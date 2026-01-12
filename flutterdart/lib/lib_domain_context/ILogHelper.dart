// ignore_for_file: avoid_print
// ignore_for_file: prefer_interpolation_to_compose_strings

class ILogHelper
{
  void log(Exception exception, [bool subError = false])
  {
    print("Error: " + exception.toString());
  }
}