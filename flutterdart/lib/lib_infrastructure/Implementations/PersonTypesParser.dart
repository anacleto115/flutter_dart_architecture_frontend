// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: prefer_collection_literals
import '../../lib_domain_context/IParser.dart';
import '../../lib_domain_entities/Models/PersonTypes.dart';

class PersonTypesParser extends IParser<PersonTypes>
{
  @override
  PersonTypes? createEntity(dynamic itemArray)
  {
    PersonTypes entity = PersonTypes();
    entity.setId(itemArray[0]);
    entity.setName(itemArray[1]);
    return entity;
  }

  @override
  PersonTypes? toEntity(Map<String, dynamic> data)
  {
    var entity = PersonTypes();
    entity.setId(int.parse(data["Id"].toString()));
    if (data.containsKey("Name"))
      entity.setName(data["Name"].toString());
    return entity;
  }

  @override
  Map<String, dynamic>? toDictionary(PersonTypes entity)
  {
    var data = Map<String, dynamic>();
    data["Id"] = entity.getId().toString();
    if (entity.getName() != null && entity.getName() != "")
      data["Name"] = entity.getName().toString();
    return data;
  }

  @override
  bool validate(PersonTypes entity)
  {
    if (entity.getName() == null || entity.getName() == "")
      return false;
    return true;
  }
}