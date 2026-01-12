// ignore_for_file: prefer_collection_literals
// ignore_for_file: avoid_init_to_null

class RsHome
{
  Map<String, String>? data = null;

  RsHome(String language)
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
    data!["lbTitle"] = "Welcome";
  }

  void es()
  {
    data!["lbTitle"] = "Bienvenido";
  }
}