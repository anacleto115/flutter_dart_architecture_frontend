// ignore_for_file: avoid_init_to_null

class IViewModel<T>
{
  T? current = null;
  T? currentCopy = null;
  List<T>? list = [];

  void setCurrent(T? v) { current = v; }
  T? getCurrent() { return current; }
  void setCurrentCopy(T? v) { currentCopy = v; }
  T? getCurrentCopy() { return currentCopy; }
  void setList(List<T>? v) { list = v; }
  List<T>? getList() { return list; }

  T? createNew() { return null; }
  T? getItem(T t) { return null; }
  void createCopy() { }
  bool comparer(T t1, T t2) { return false; }

  Map<String, dynamic> load(Map<String, dynamic> data) { return data; }
  Future<Map<String, dynamic>> select(Map<String, dynamic> data) async { return data; }
  Future<Map<String, dynamic>> newOne(Map<String, dynamic> data) async { return data; }
  Future<Map<String, dynamic>> modify(Map<String, dynamic> data) async { return data; }
  Future<Map<String, dynamic>> save(Map<String, dynamic> data) async { return data; }
  Future<Map<String, dynamic>> delete(Map<String, dynamic> data) async { return data; }
  Future<Map<String, dynamic>> close(Map<String, dynamic> data) async { return data; }
}