import 'DLinqList.dart';

class DLinq
{
  static DLinqList<T> from<T>(List<T> list)
  {
    return DLinqList<T>(list);
  }
}