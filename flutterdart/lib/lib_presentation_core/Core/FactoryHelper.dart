// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: avoid_init_to_null
import '../../lib_domain_context/IFactory.dart';
import '../../lib_domain_context/IHelper.dart';

class FactoryHelper
{
  static IFactory<IHelper>? iFactoryHelper = null;

  static IHelper? get(Map<String, dynamic> data)
  {
    if (iFactoryHelper == null)
      return null;

    return iFactoryHelper!.get(data);
  }
}