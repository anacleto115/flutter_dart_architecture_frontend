// ignore_for_file: curly_braces_in_flow_control_structures, avoid_init_to_null
import 'ICaller.dart';
import 'IFactory.dart';

class FactoryCaller
{
  static IFactory<ICaller>? iFactoryCaller = null;

  static ICaller? get(Map<String, dynamic> data)
  {
    if (iFactoryCaller == null)
      return null;

    return iFactoryCaller!.get(data);
  }
}