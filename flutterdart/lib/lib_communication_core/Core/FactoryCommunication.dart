// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: avoid_init_to_null
import '../../lib_domain_context/IFactory.dart';
import '../../lib_domain_context/ICommunication.dart';

class FactoryCommunication
{
  static IFactory<ICommunication>? iFactoryCommunication = null;

  static ICommunication? get(Map<String, dynamic> data)
  {
    if (iFactoryCommunication == null)
      return null;

    return iFactoryCommunication!.get(data);
  }
}