// ignore_for_file: avoid_init_to_null
// ignore_for_file: curly_braces_in_flow_control_structures
import 'CacheHelper.dart';

class CacheDictionary extends ICacheHelper
{
  Map<String, dynamic>? data = null;

  @override
  void add(String key, dynamic value)
  {
    instance();
    data![key] = value;
  }

  @override
  bool contains(String key)
  {
    instance();
    return data!.containsKey(key);
  }

  @override
  dynamic get(String key)
  {
    instance();
    if (!contains(key))
      return null;
    return data![key];
  }

@override
  void instance()
  {
    if (data != null)
      return;
    data = Map<String, dynamic>();
  }

  @override
  void remove(String key)
  {
    instance();
    if (!contains(key))
      return;
    data!.remove(key);
  }
}