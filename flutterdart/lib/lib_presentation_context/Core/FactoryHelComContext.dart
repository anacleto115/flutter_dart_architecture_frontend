
import '../../lib_domain_context/Enumerables.dart';
import '../../lib_domain_context/IFactory.dart';
import '../../lib_domain_context/IHelper.dart';
import '../Implementations/Helpers/Communications/PersonTypesHelper.dart';

class FactoryHelComContext implements IFactory<IHelper>
{
  @override
  IHelper? get(Map<String, dynamic> data)
  {
    Types type = data["Type"] as Types;
    switch (type)
    {
      case Types.PersonTypes: return PersonTypesHelper(data);
      default: return null;
    }
  }
}