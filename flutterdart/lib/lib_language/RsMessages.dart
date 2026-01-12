// ignore_for_file: prefer_collection_literals
// ignore_for_file: avoid_init_to_null

class RsMessages
{
  Map<String, String>? data = null;

  RsMessages(String language)
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
    data!["lbActive"] = "Active";
    data!["lbDeleteEntity"] = "Do you want to delete the selected item?";
    data!["lbExists"] = "The item is already exist.";
    data!["lbInactive"] = "Inactive";
    data!["lbLoading"] = "Loading...";
    data!["lbMessage"] = "Message";
    data!["lbNoExist"] = "The information no longer exists.";
    data!["lbSelectItem"] = "Please, select a item in the list.";
    data!["lbSqlError"] = "Please, contact to your administrator.";
    data!["lbThisIsInUse"] = "This item is in used, you cannot delete it.";
    data!["lbTryAgain"] = "Please, try again.";
    data!["lbMissingInfo"] = "Please check, there is missing information.";
  }

  void es()
  {
    data!["lbActive"] = "Activo";
    data!["lbDeleteEntity"] = "¿Desea eliminar el elemento seleccionado?";
    data!["lbExists"] = "El elemento ya existe.";
    data!["lbInactive"] = "Inactivo";
    data!["lbLoading"] = "Cargando...";
    data!["lbMessage"] = "Mensaje";
    data!["lbNoExist"] = "La información ya no existe.";
    data!["lbSelectItem"] = "Por favor, seleccione un elemento de la lista.";
    data!["lbSqlError"] = "Por favor, póngase en contacto con su administrador.";
    data!["lbThisIsInUse"] = "Este elemento está en uso, no puede eliminarlo.";
    data!["lbTryAgain"] = "Por favor, intente de nuevo.";
    data!["lbMissingInfo"] = "Por favor verifique, falta información.";
  }
}