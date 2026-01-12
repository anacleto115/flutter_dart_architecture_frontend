// ignore_for_file: avoid_init_to_null
// ignore_for_file: prefer_collection_literals
// ignore_for_file: curly_braces_in_flow_control_structures
import 'Applications/RsLogin.dart';
import 'Applications/RsPersons.dart';
import 'Maintenances/RsHome.dart';
import 'Maintenances/RsPersonTypes.dart';
import 'RsMenu.dart';
import 'RsMessages.dart';

class Bundle
{
  static Map<String, dynamic>? data = null;

  static void load(String language)
  {
    Bundle.data = Bundle.data ?? Map<String, dynamic>();
    Bundle.data!["RsMenu"] = (RsMenu(language)).get();
    Bundle.data!["RsMessages"] = (RsMessages(language)).get();
    Bundle.data!["RsHome"] = (RsHome(language)).get();
    Bundle.data!["RsPersonTypes"] = (RsPersonTypes(language)).get();
    Bundle.data!["RsLogin"] = (RsLogin(language)).get();
    Bundle.data!["RsPersons"] = (RsPersons(language)).get();
  }

  static String get(String resource, String key)
  {
    String response = "";
    if (!Bundle.data!.containsKey(resource))
      return response;
    Map<String, String> resources = Bundle.data![resource] as Map<String, String>;
    if (!resources.containsKey(key))
      return response;
    return resources[key]!;
  }
}