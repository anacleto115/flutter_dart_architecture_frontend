// ignore_for_file: avoid_init_to_null
// ignore_for_file: prefer_collection_literals
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: use_function_type_syntax_for_parameters
// ignore_for_file: no_leading_underscores_for_local_identifiers

class DLinqList<T>
{
  List<T>? list = null;

  DLinqList(List<T> _list)
  {
    list = _list;
  }

  List<T> toList() { return list!; }
  List<T> toArray() { return list!; }
  Iterable<T> asEnumerable() { return list!; }

  Iterable<T> where(bool condition(T x))
  {
    return list?.where(condition) as Iterable<T>;
  }

  Map<dynamic, T> toDictionary(dynamic condition(T x))
  {
    var response = Map<dynamic, T>();
    for (var item in list!)
      response[condition(item)] = item;
    return response;
  }

  List<X> cast<X>()
  {
    List<X> response = [];
    for (var item in list!)
      response.add(item as X);
    return response;
  }

  List<bool> select(bool condition(T x))
  {
    List<bool> response = [];
    for (var item in list!)
      response.add(condition(item));
    return response;
  }

  List selectMany(dynamic condition(T x))
  {
    List response = [];
    for (var item in list!)
      response.add(condition(item));
    return response;
  }

  List<T> orderBy(dynamic condition(T x))
  {
    var response = list?.toList();
    response?.sort((t, t2) => condition(t).compareTo(condition(t2)));
    return response!;
  }

  List<T> orderByDescending(dynamic condition(T x))
  {
    return orderBy(condition).reversed.toList();;
  }

  List<T> join(List<T> list2)
  {
    return list! + list2;
  }

  Map<X, int> groupBy<X>(dynamic condition(T x))
  {
    return toLookup<X>(condition);
  }

  Map<X, int> toLookup<X>(dynamic condition(T x))
  {
    var response = Map<X, int>();
    for (var item in list!)
    {
      if (response.containsKey(condition(item)))
      {
        response[condition(item)] = (response[condition(item)] as int) + 1;
        continue;
      }
      response[condition(item)] = 1;
    }
    return response;
  }

  bool any(dynamic condition(T x))
  {
    List response = [];
    for (var item in list!)
    {
      if (!condition(item))
        continue;
      return true;
    }
    return false;
  }

  bool all(dynamic condition(T x))
  {
    List response = [];
    for (var item in list!)
    {
      if (condition(item))
        continue;
      return false;
    }
    return true;
  }

  bool contains(T x)
  {
    List response = [];
    for (var item in list!)
    {
      if (item != x)
        continue;
      return true;
    }
    return false;
  }

  List<T> take(int size)
  {
    List<T> response = [];
    int count = 0;
    for (var item in list!)
    {
      count++;
      response.add(item);
      if (count >= size)
        break;
    }
    return response;
  }

  List<T> skip(int size)
  {
    List<T> response = [];
    int count = 0;
    for (var item in list!)
    {
      count++;
      if (count <= size)
        continue;
      response.add(item);
    }
    return response;
  }

  List<T> takeWhile(bool condition(T x))
  {
    return where(condition).toList();
  }

  List<T> skipWhile(bool condition(T x))
  {
    List<T> response = [];
    for (var item in list!)
    {
      if (condition(item))
        continue;
      response.add(item);
    }
    return response;
  }

  List<T> union(List<T> list2)
  {
    return list! + list2;
  }

  List<T> distinct()
  {
    return list!.toSet().toList();
  }

  List<T> intersect(List<T> list2)
  {
    List<T> response = [...list!];
    response!.retainWhere((item) => list2.contains(item));
    return response;
  }

  List<T> except(List<T> list2)
  {
    List<T> response = [...list!];
    response!.removeWhere((item) => list2.contains(item));
    return response;
  }

  T? firstOrDefault([bool condition(T x)?])
  {
    return first(condition);
  }

  T? first([bool condition(T x)?])
  {
    for (var item in list!)
    {
      if (condition == null || condition(item))
      {
        return item;
      }
    }
    return null;
  }

  T? lastOrDefault([bool condition(T x)?])
  {
    return last(condition);
  }

  T? last([bool condition(T x)?])
  {
    List<T> response = [...list!];
    response = response.reversed.toList();
    for (var item in response)
    {
      if (condition == null || condition(item))
      {
        return item;
      }
    }
    return null;
  }

  T? elementAtOrDefault(int position)
  {
    return elementAt(position);
  }

  T? elementAt(int position)
  {
    if (position > list!.length)
      return null;
    return list![position];
  }

  T? singleOrDefault([bool condition(T x)?])
  {
    return single(condition);
  }

  T? single([bool condition(T x)?])
  {
    List<T> temp = where(condition!).toList();
    if (temp.length > 1)
      throw Exception("The list has more than one item");
    return temp[0];
  }

  double count([bool condition(T x)?])
  {
    if (condition == null)
      return list!.length.toDouble();
    return where(condition!).toList().length.toDouble();
  }

  double sum(dynamic condition(T x))
  {
    double response = 0.0;
    for (var item in list!)
      response += condition(item).toDouble();
    return response;
  }

  double? min(dynamic condition(T x))
  {
    double? response = null;
    for (var item in list!)
    {
      var temp = condition(item).toDouble();
      if (response != null && response < temp)
        continue;
      response = temp;
    }
    return response;
  }

  double? max(dynamic condition(T x))
  {
    double? response = null;
    for (var item in list!)
    {
      var temp = condition(item).toDouble();
      if (response != null && response > temp)
        continue;
      response = temp;
    }
    return response;
  }

  double average(dynamic condition(T x))
  {
    return sum(condition) / list!.length;
  }
}