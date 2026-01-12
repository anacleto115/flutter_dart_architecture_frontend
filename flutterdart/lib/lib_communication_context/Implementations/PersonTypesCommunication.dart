// ignore_for_file: avoid_init_to_null
import '../../lib_communication_core/Interfaces/IPersonTypesCommunication.dart';
import '../Core/Communication.dart';

class PersonTypesCommunication extends IPersonTypesCommunication
{
  Communication? communication = null;

  PersonTypesCommunication(Map<String, dynamic> data)
  {
    communication = Communication();
    communication!.iCommunication = this;
  }

  @override
  Map<String, dynamic> load(Map<String, dynamic> data)
  {
    data = communication!.load(data);
    communication!.service = "srw_persons";
    communication!.name = "PersonTypes";
    return data;
  }

  @override
  Future<Map<String, dynamic>> select(Map<String, dynamic> data) async
  {
    return await communication!.select(data);
  }

  @override
  Future<Map<String, dynamic>> insert(Map<String, dynamic> data) async
  {
    return await communication!.insert(data);
  }

  @override
  Future<Map<String, dynamic>> update(Map<String, dynamic> data) async
  {
    return await communication!.update(data);
  }

  @override
  Future<Map<String, dynamic>> delete(Map<String, dynamic> data) async
  {
    return await communication!.delete(data);
  }
}