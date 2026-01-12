// ignore_for_file: avoid_init_to_null
import '../../lib_domain_context/IConfiguration.dart';
import '../../lib_domain_context/IParser.dart';

class Helper<T>
{
  IParser<T>? iParser = null;
  IConfiguration? iConfiguration = null;

  Map<String, dynamic> load(Map<String, dynamic> data)
  {
    data["Client"] = "Default";
    return data;
  }
}