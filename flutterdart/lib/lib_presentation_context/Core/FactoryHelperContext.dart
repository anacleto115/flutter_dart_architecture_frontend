// ignore_for_file: curly_braces_in_flow_control_structures
import '../../lib_domain_context/IFactory.dart';
import '../../lib_domain_context/IHelper.dart';
import 'FactoryHelComContext.dart';

class FactoryHelperContext implements IFactory<IHelper>
{
  FactoryHelComContext factoryHelComContext = FactoryHelComContext();

  @override
  IHelper? get(Map<String, dynamic> data)
  {
    return factoryHelComContext.get(data);
  }
}