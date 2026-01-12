// ignore_for_file: avoid_init_to_null
// ignore_for_file: curly_braces_in_flow_control_structures
import '../../../../lib_communication_core/Core/FactoryCommunication.dart';
import '../../../../lib_domain_context/Enumerables.dart';
import '../../../../lib_domain_entities/Models/PersonTypes.dart';
import '../../../../lib_infrastructure/Implementations/PersonTypesParser.dart';
import '../../../../lib_presentation_core/Interfaces/Helpers/IPersonTypesHelper.dart';
import '../../../Core/HelperCommunication.dart';

class PersonTypesHelper extends IPersonTypesHelper
{
  HelperCommunication<PersonTypes>? helperCommunication = null;

  PersonTypesHelper(Map<String, dynamic> data)
  {
    helperCommunication = HelperCommunication<PersonTypes>();
    helperCommunication!.iHelper = this;
  }

  @override
  Map<String, dynamic> load(Map<String, dynamic> data)
  {
    data = helperCommunication!.load(data);
    helperCommunication!.helper!.iParser = PersonTypesParser();
    data["Type"] = Types.PersonTypes;
    if (!data.containsKey("ICommunication"))
      helperCommunication!.iCommunication =
          helperCommunication!.iCommunication ?? FactoryCommunication.get(data);
    data.remove("Type");
    return data;
  }

  @override
  Future<Map<String, dynamic>> select(Map<String, dynamic> data) async
  {
    return await helperCommunication!.select(data);
  }

  @override
  Future<Map<String, dynamic>> insert(Map<String, dynamic> data) async
  {
    return await helperCommunication!.insert(data);
  }

  @override
  Future<Map<String, dynamic>> update(Map<String, dynamic> data) async
  {
    return await helperCommunication!.update(data);
  }

  @override
  Future<Map<String, dynamic>> delete(Map<String, dynamic> data) async
  {
    return await helperCommunication!.delete(data);
  }
}