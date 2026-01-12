
class IParser<T>
{
  T? createEntity(dynamic itemArray) { return null; }
  T? toEntity(Map<String, dynamic> data) { return null; }
  Map<String, dynamic>? toDictionary(T entity) { return null; }
  bool validate(T entity) { return false; }
}