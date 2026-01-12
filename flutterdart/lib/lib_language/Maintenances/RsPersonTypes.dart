// ignore_for_file: prefer_collection_literals
// ignore_for_file: avoid_init_to_null

class RsPersonTypes
{
  Map<String, String>? data = null;

  RsPersonTypes(String language)
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
    data!["clName"] = "NAME";
    data!["lbName"] = "Name*: ";
    data!["lbSubTitle"] = "Person type";
    data!["lbTitle"] = "Person types";
  }

  void es()
  {
    data!["clName"] = "NOMBRE";
    data!["lbName"] = "Nombre*: ";
    data!["lbSubTitle"] = "Tipo de persona";
    data!["lbTitle"] = "Tipos de personas";
  }
}