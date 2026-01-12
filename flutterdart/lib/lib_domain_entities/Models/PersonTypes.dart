// ignore_for_file: non_constant_identifier_names

class PersonTypes
{
  int _Id = 0;

  void setId(int v) { _Id = v; }
  int getId() { return _Id; }

  String _Name = "";

  void setName(String v) { _Name = v; }
  String getName() { return _Name; }

  @override int get_Id() { return _Id; }
  @override dynamic getClone()
  {
    var copy = PersonTypes();
    copy._Id = _Id;
    copy._Name = _Name;
    return copy;
  }
}