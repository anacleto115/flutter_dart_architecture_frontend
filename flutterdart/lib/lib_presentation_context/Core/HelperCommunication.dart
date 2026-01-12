// ignore_for_file: avoid_init_to_null
// ignore_for_file: prefer_collection_literals
// ignore_for_file: curly_braces_in_flow_control_structures
import '../../lib_communication_context/Core/FactoryCommunicationContext.dart';
import '../../lib_communication_core/Core/FactoryCommunication.dart';
import '../../lib_domain_context/ICommunication.dart';
import '../../lib_domain_context/IHelper.dart';
import '../../lib_domain_context/MessagesHelper.dart';
import 'ErrorHelper.dart';
import 'Helper.dart';

class HelperCommunication<T> extends IHelper
{
  IHelper? iHelper = null;
  ICommunication? iCommunication = null;
  Helper<T>? helper = null;

  HelperCommunication()
  {
    helper = Helper<T>();
  }

  @override
  Map<String, dynamic> load(Map<String, dynamic> data)
  {
    data = helper!.load(data);
    FactoryCommunication.iFactoryCommunication =
      FactoryCommunication.iFactoryCommunication ?? FactoryCommunicationContext();
    if (data.containsKey("ICommunication"))
      iCommunication = data["ICommunication"] as ICommunication;
    return data;
  }

  @override
  Future<Map<String, dynamic>> select(Map<String, dynamic> data) async
  {
    Map<String, dynamic> response = Map<String, dynamic>();
    try
    {
      data = iHelper!.load(data);
      response = await iCommunication!.select(data);
      if (response.containsKey("Error"))
      {
        MessagesHelper.show(
          ErrorHelper.getMessage(response["Error"].toString()));
        return response;
      }
      if (helper!.iParser != null && response.containsKey("Entities"))
      {
        List<T> list = [];
        var dic = Map<String, dynamic>();

        var temp = response["Entities"] as Map<String, dynamic>;
        temp.forEach((k,v) =>
          list.add(helper!.iParser!.toEntity(v as Map<String, dynamic>) as T)
        );
        response["Entities"] = list;
      }
      return response;
    }
    catch (ex)
    {
      response = Map<String, dynamic>();
      response["Error"] = ex.toString();
      return response;
    }
  }

  @override
  Future<Map<String, dynamic>> insert(Map<String, dynamic> data) async
  {
    Map<String, dynamic> response = Map<String, dynamic>();
    try
    {
      data = iHelper!.load(data);
      if (helper!.iParser != null &&
        data.containsKey("Entity") &&
        !helper!.iParser!.validate(data["Entity"] as T))
      {
        response["Error"] = "lbMissingInfo";
        MessagesHelper.show(
          ErrorHelper.getMessage(response["Error"].toString()));
        return response;
      }
      if (helper!.iParser != null &&
        data.containsKey("Entity"))
        data["Entity"] = helper!.iParser!.toDictionary(data["Entity"] as T);
      response = await iCommunication!.insert(data);
      if (response.containsKey("Error"))
      {
        MessagesHelper.show(
          ErrorHelper.getMessage(response["Error"].toString()));
        return response;
      }
      if (helper!.iParser != null &&
        response.containsKey("Entity"))
        response["Entity"] = helper!.iParser!.toEntity(response["Entity"] as Map<String, dynamic>);
      return response;
    }
    catch (ex)
    {
      response = Map<String, dynamic>();
      response["Error"] = ex.toString();
      return response;
    }
  }

  @override
  Future<Map<String, dynamic>> update(Map<String, dynamic> data) async
  {
    Map<String, dynamic> response = Map<String, dynamic>();
    try
    {
      data = iHelper!.load(data);
      if (helper!.iParser != null &&
        data.containsKey("Entity") &&
        !helper!.iParser!.validate(data["Entity"] as T))
      {
        response["Error"] = "lbMissingInfo";
        MessagesHelper.show(
          ErrorHelper.getMessage(response["Error"].toString()));
        return response;
      }
      if (helper!.iParser != null &&
        data.containsKey("Entity"))
        data["Entity"] = helper!.iParser!.toDictionary(data["Entity"] as T);
      response = await iCommunication!.update(data);
      if (response.containsKey("Error"))
      {
        MessagesHelper.show(
          ErrorHelper.getMessage(response["Error"].toString()));
        return response;
      }
      if (helper!.iParser != null &&
        response.containsKey("Entity"))
        response["Entity"] = helper!.iParser!.toEntity(response["Entity"] as Map<String, dynamic>);
      return response;
    }
    catch (ex)
    {
      response = Map<String, dynamic>();
      response["Error"] = ex.toString();
      return response;
    }
  }

  @override
  Future<Map<String, dynamic>> delete(Map<String, dynamic> data) async
  {
    Map<String, dynamic> response = Map<String, dynamic>();
    try
    {
      data = iHelper!.load(data);
      if (helper!.iParser != null &&
        data.containsKey("Entity") &&
        !helper!.iParser!.validate(data["Entity"] as T))
      {
        response["Error"] = "lbMissingInfo";
        MessagesHelper.show(
          ErrorHelper.getMessage(response["Error"].toString()));
        return response;
      }
      if (helper!.iParser != null &&
        data.containsKey("Entity"))
        data["Entity"] = helper!.iParser!.toDictionary(data["Entity"] as T);
      response = await iCommunication!.delete(data);
      if (response.containsKey("Error"))
      {
        MessagesHelper.show(
          ErrorHelper.getMessage(response["Error"].toString()));
        return response;
      }
      if (helper!.iParser != null &&
        response.containsKey("Entity"))
        response["Entity"] = helper!.iParser!.toEntity(response["Entity"] as Map<String, dynamic>);
      return response;
    }
    catch (ex)
    {
      response = Map<String, dynamic>();
      response["Error"] = ex.toString();
      return response;
    }
  }
}