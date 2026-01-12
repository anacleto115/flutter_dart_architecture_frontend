// ignore_for_file: prefer_collection_literals
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: avoid_init_to_null
import 'package:http/http.dart' as http;
import '../../lib_domain_context/ICaller.dart';
import '../../lib_domain_context/ServiceData.dart';
import '../../lib_utilities/Utilities/Convert.dart';
import '../../lib_utilities/Utilities/JsonHelper.dart';

class CallerServices implements ICaller
{
  static String? token = null;
  static DateTime? expires = null;

  @override
  Future<Map<String, dynamic>> execute(Map<String, dynamic> data) async
  {
    var response = Map<String, dynamic>();
    try
    {
      response = await authenticate(data);
      if (response == null || response.containsKey("Error"))
        return response;
      response.clear();

      if (data.containsKey("Architecture"))
        data.remove("Architecture");
      String _url = data["Url"].toString();
      data.remove("Url");
      data.remove("UrlToken");
      data["Bearer"] = token;
      String stringData = JsonHelper.convertToString(data);

      var uri = Uri.parse(_url);
      var request = await http.post(uri,
          headers: {"Content-Type": "application/text"},
          body: stringData
      );
      var resp = request.body.replaceAll("\"", "").replaceAll("\\", "'").replaceAll("'", "\"");

      response = JsonHelper.convertToObject(resp);
      return response;
    }
    catch (ex)
    {
      response["Error"] = ex.toString();
      return response;
    }
  }

  Future<Map<String, dynamic>> authenticate(Map<String, dynamic> data) async
  {
    var response = Map<String, dynamic>();
    try
    {
      if (expires != null &&
        DateTime.now().difference(expires!).inMinutes > 1)
      {
        data["Response"] = "Ok";
        return response;
      }

      var temp = Map<String, dynamic>();
      String _url = data["UrlToken"].toString();
      temp["User"] = ServiceData.userData;
      String stringData = JsonHelper.convertToString(temp);

      var uri = Uri.parse(_url);
      var request = await http.post(uri,
          headers: {"Content-Type": "application/text"},
          body: stringData
      );
      var resp = request.body.replaceAll("\"", "").replaceAll("\\", "'").replaceAll("'", "\"");
      response = JsonHelper.convertToObject(resp);

      token = response["Token"].toString();
      expires = Convert.serviceToDate(response["Expires"].toString());
      return response;
    }
    catch (ex)
    {
      response["Error"] = ex.toString();
      return response;
    }
  }
}