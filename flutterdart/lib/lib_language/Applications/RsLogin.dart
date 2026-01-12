// ignore_for_file: prefer_collection_literals
// ignore_for_file: avoid_init_to_null

class RsLogin
{
  Map<String, String>? data = null;

  RsLogin(String language)
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
    data!["lbPassword"] = "Password: ";
    data!["lbTitle"] = "LOGIN";
    data!["lbUser"] = "User: ";
  }

  void es()
  {
    data!["lbPassword"] = "Contraseña: ";
    data!["lbTitle"] = "INICIO DE SESIÓN";
    data!["lbUser"] = "Usuario: ";
  }
}