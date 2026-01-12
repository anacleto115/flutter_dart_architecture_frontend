
import '../../lib_domain_context/IFactory.dart';
import '../../lib_domain_context/ICaller.dart';
import 'CallerServices.dart';

class FactoryCallerContext implements IFactory<ICaller>
{
  @override
  ICaller? get(Map<String, dynamic> data)
  {
    return CallerServices();
  }
}