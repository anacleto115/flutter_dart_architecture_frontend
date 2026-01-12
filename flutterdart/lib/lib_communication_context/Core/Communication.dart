// ignore_for_file: prefer_interpolation_to_compose_strings
// ignore_for_file: avoid_init_to_null
// ignore_for_file: curly_braces_in_flow_control_structures
import '../../lib_domain_context/FactoryCaller.dart';
import '../../lib_domain_context/ICaller.dart';
import '../../lib_domain_context/ICommunication.dart';

class Communication implements ICommunication
{
  ICaller? client = null;
  ICommunication? iCommunication = null;
  String name = "",
    service = "",
    end = "";
  static String protocol = "http://",
    base = "192.168.0.35",
    createBy = "Communication";

  @override
  Map<String, dynamic> load(Map<String, dynamic> data)
  {
    client = client ?? FactoryCaller.get(data);
    return data;
  }

  Map<String, dynamic> buildUrl(Map<String, dynamic> data, String method)
  {
    data["Url"] = protocol + base + "/" + service + "/" + name + "/" + method + end;
    data["UrlToken"] = protocol + base + "/" + service + "/Token/Authenticate" + end;
    if (!data.containsKey("create_by"))
      data["create_by"] = createBy;
    return data;
  }

  @override
  Future<Map<String, dynamic>> select(Map<String, dynamic> data) async
  {
    data = iCommunication!.load(data);
    data = buildUrl(data, "Select");
    return await client!.execute(data);
  }

  @override
  Future<Map<String, dynamic>> insert(Map<String, dynamic> data) async
  {
    data = iCommunication!.load(data);
    data = buildUrl(data, "Insert");
    return await client!.execute(data);
  }

  @override
  Future<Map<String, dynamic>> update(Map<String, dynamic> data) async
  {
    data = iCommunication!.load(data);
    data = buildUrl(data, "Update");
    return await client!.execute(data);
  }

  @override
  Future<Map<String, dynamic>> delete(Map<String, dynamic> data) async
  {
    data = iCommunication!.load(data);
    data = buildUrl(data, "Delete");
    return await client!.execute(data);
  }
}