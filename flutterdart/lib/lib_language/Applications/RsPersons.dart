// ignore_for_file: prefer_collection_literals
// ignore_for_file: avoid_init_to_null

class RsPersons
{
  Map<String, String>? data = null;

  RsPersons(String language)
  {
    data = Map<String, String>();
    load(language);
  }

  Map<String, String> get()
  {
    return data!;
  }

  void load(String language)
  {
    switch (language)
    {
      case "Es": es(); break;
      default: en(); break;
    }
  }

  void en()
  {
    data!["clBorn"] = "BORN";
    data!["clFile"] = "FILE";
    data!["clName"] = "NAME";
    data!["clSSN"] = "SSN";
    data!["clState"] = "STATE";
    data!["clType"] = "TYPE";
    data!["lbBorn"] = "Born*: ";
    data!["lbFile"] = "File: ";
    data!["lbName"] = "Name*: ";
    data!["lbSSN"] = "SSN*: ";
    data!["lbState"] = "State";
    data!["lbSubTitle"] = "Person";
    data!["lbTitle"] = "Persons";
    data!["lbType"] = "Type*: ";
  }

  void es()
  {
    data!["clBorn"] = "FECHA N.";
    data!["clFile"] = "ARCHIVO";
    data!["clName"] = "NOMBRE";
    data!["clSSN"] = "CEDULA";
    data!["clState"] = "ESTADO";
    data!["clType"] = "TIPO";
    data!["lbBorn"] = "Fecha n*: ";
    data!["lbFile"] = "Archivo: ";
    data!["lbName"] = "Nombre*: ";
    data!["lbSSN"] = "Cedula*: ";
    data!["lbState"] = "Estado";
    data!["lbSubTitle"] = "Persona";
    data!["lbTitle"] = "Personas";
    data!["lbType"] = "Tipo*: ";
  }
}