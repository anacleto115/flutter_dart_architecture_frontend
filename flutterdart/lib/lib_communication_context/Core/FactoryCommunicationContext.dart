
import '../../lib_domain_context/Enumerables.dart';
import '../../lib_domain_context/IFactory.dart';
import '../../lib_domain_context/ICommunication.dart';
import '../Implementations/PersonTypesCommunication.dart';

class FactoryCommunicationContext implements IFactory<ICommunication>
{
  @override
  ICommunication? get(Map<String, dynamic> data)
  {
    Types type = data["Type"] as Types;
    switch (type)
    {
      case Types.PersonTypes: return PersonTypesCommunication(data);
      default: return null;
    }
  }
}