// ignore_for_file: prefer_collection_literals
// ignore_for_file: avoid_init_to_null

class RsMenu
{
  Map<String, String>? data = null;

  RsMenu(String language)
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
    data!["lbAccept"] = "Accept";
    data!["lbAction"] = "ACTION";
    data!["lbApp"] = "PersonsApp";
    data!["lbApplications"] = "Applications";
    data!["lbCancel"] = "Cancel";
    data!["lbClean"] = "Clean";
    data!["lbClose"] = "Close";
    data!["lbEnter"] = "Enter";
    data!["lbHome"] = "Home";
    data!["lbLogin"] = "Login";
    data!["lbMaintenances"] = "Maintenances";
    data!["lbMenu"] = "Menu";
    data!["lbMessage"] = "Message";
    data!["lbPersons"] = "Persons";
    data!["lbPersonTypes"] = "Person types";

    data!["lbSelectAction"] = "SELECT ACTION";
    data!["lbKeyToClose"] = "ANOTHER KEY TO CLOSE";
    data!["lbEntityData"] = "ENTITY DATA";
    data!["lbSelect"] = "Load";
    data!["lbSave"] = "Save";
    data!["lbInsert"] = "Create";
    data!["lbUpdate"] = "Modify";
    data!["lbDelete"] = "Delete";
    data!["lbChoose"] = "Choose";
    data!["lbCompleted"] = "Completed";
  }

  void es()
  {
    data!["lbAccept"] = "Aceptar";
    data!["lbAction"] = "ACCIÓN";
    data!["lbApp"] = "PersonsApp";
    data!["lbApplications"] = "Aplicaciones";
    data!["lbCancel"] = "Cancelar";
    data!["lbClean"] = "Limpiar";
    data!["lbClose"] = "Cerrar";
    data!["lbEnter"] = "Entrar";
    data!["lbHome"] = "Inicio";
    data!["lbLogin"] = "Inicio de sessión";
    data!["lbMaintenances"] = "Mantenimientos";
    data!["lbMenu"] = "Menu";
    data!["lbMessage"] = "Mensaje";
    data!["lbPersons"] = "Personas";
    data!["lbPersonTypes"] = "Tipos de personas";

    data!["lbSelectAction"] = "SELECCIONE LA ACCIÓN";
    data!["lbKeyToClose"] = "OTRA TECLA PARA CERRAR";
    data!["lbEntityData"] = "DATOS DE LA ENTIDAD";
    data!["lbSelect"] = "Cargar";
    data!["lbSave"] = "Guardar";
    data!["lbInsert"] = "Crear";
    data!["lbUpdate"] = "Modificar";
    data!["lbDelete"] = "Borrar";
    data!["lbChoose"] = "Seleccionar";
    data!["lbCompleted"] = "Completado";
  }
}