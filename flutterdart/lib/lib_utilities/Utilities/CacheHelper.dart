// ignore_for_file: prefer_conditional_assignment
// ignore_for_file: avoid_init_to_null
// ignore_for_file: prefer_collection_literals
// ignore_for_file: curly_braces_in_flow_control_structures
import 'CacheDictionary.dart';

class ICacheHelper
{
  void add(String key, Object value) { }
  void instance() {}
  bool contains(String key) { return false; }
  dynamic get(String key) { return null; }
  void remove(String key) { }
}

class CacheHelper
{
  static ICacheHelper? iCacheHelper = null;

  static void add(String key, Object value)
  {
    createInstance();
    iCacheHelper!.add(key, value);
  }

  static void createInstance([ICacheHelper? i = null])
  {
    if (iCacheHelper != null)
      return;
    if (i != null)
      iCacheHelper = i;
    else if (iCacheHelper == null)
      iCacheHelper = CacheDictionary();
  }

  static bool contains(String key)
  {
    createInstance();
    return iCacheHelper!.contains(key);
  }

  static dynamic get(String key)
  {
    createInstance();
    return iCacheHelper!.get(key);
  }

  static void remove(String key)
  {
    createInstance();
    iCacheHelper!.remove(key);
  }
}