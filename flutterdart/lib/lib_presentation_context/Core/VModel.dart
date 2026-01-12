// ignore_for_file: avoid_init_to_null
// ignore_for_file: prefer_collection_literals
// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter_dart/lib_domain_context/IEntities.dart';
import '../../lib_domain_context/Enumerables.dart';
import '../../lib_domain_context/IHelper.dart';
import '../../lib_domain_context/IScreen.dart';
import '../../lib_domain_context/IViewModel.dart';
import '../../lib_domain_context/LogHelper.dart';
import '../../lib_domain_context/MessagesHelper.dart';
import '../../lib_language/Bundle.dart';
import '../../lib_presentation_core/Core/FactoryHelper.dart';
import 'FactoryHelperContext.dart';
import '../../lib_utilities/Utilities/DLinq.dart';

class VModel<T> extends IViewModel<T>
{
  IViewModel<T>? iViewModel = null;
  List<T>? copy = null;
  IScreen? iScreen = null;
  IHelper? iHelper = null;
  Architecture architecture = Architecture.Services;
  bool isLoading = false;
  int fontSize = 16;
  String lbSelectItem = "", lbDeleteEntity = "";

  VModel(Map<String, dynamic> data)
  {
    try
    {
      if (data.containsKey("Architecture"))
      {
        architecture = data["Architecture"] as Architecture;
        data.remove("Architecture");
      }
      if (data.containsKey("View"))
      {
        iScreen = data["View"] as IScreen;
        data.remove("View");
      }
      resources();
      if (data.containsKey("IHelper"))
      {
        iHelper = data["IHelper"] as IHelper;
        data.remove("IHelper");
      }
      list = [];
    }
    catch (ex)
    {
      LogHelper.log(ex);
    }
  }

  @override void createCopy()
  {
    if (current == null)
      return;
    currentCopy = (current! as IEntities).getClone();
  }
  @override
  T? getItem(T t)
  {
    return DLinq.from(list!).firstOrDefault(
        (p) => (p as IEntities).get_Id() == (t as IEntities).get_Id())!;
  }

  void resources()
  {
    lbSelectItem = Bundle.get("RsMessages", "lbSelectItem");
    lbDeleteEntity = Bundle.get("RsMessages", "lbDeleteEntity");
  }

  @override
  Map<String, dynamic> load(Map<String, dynamic> data)
  {
    FactoryHelper.iFactoryHelper =
        FactoryHelper.iFactoryHelper ?? FactoryHelperContext();
    data["Architecture"] = architecture;
    return data;
  }

  @override
  Future<Map<String, dynamic>> newOne(Map<String, dynamic> data) async
  {
    Map<String, dynamic> response = Map<String, dynamic>();
    try
    {
      currentCopy = iViewModel!.createNew();
      data = data ?? Map<String, dynamic>();
      data["Action"] = Action.OPEN;
      iScreen!.change(data);
      return response;
    }
    catch (ex)
    {
      LogHelper.log(ex);
      data["Error"] = ex.toString();
      return response;
    }
  }

  @override
  Future<Map<String, dynamic>> modify(Map<String, dynamic> data) async
  {
    Map<String, dynamic> response = Map<String, dynamic>();
    try
    {
      if (current == null)
        return response;
      createCopy();
      data = data ?? Map<String, dynamic>();
      data["Action"] = Action.OPEN;
      iScreen!.change(data);
      return response;
    }
    catch (ex)
    {
      LogHelper.log(ex);
      data["Error"] = ex.toString();
      return response;
    }
  }

  @override
  Future<Map<String, dynamic>> select(Map<String, dynamic> data) async
  {
    Map<String, dynamic> response = Map<String, dynamic>();
    try
    {
      isLoading = true;
      iScreen!.loading(Loading.ADD);
      data = data ?? Map<String, dynamic>();
      data = iViewModel!.load(data);
      response = await iHelper!.select(data);
      if (response == null || !response.containsKey("Entities"))
        return response;
      list = list ?? [];
      list!.clear();
      List<T> temp = response["Entities"] as List<T>;
      for (T item in temp)
        list!.add(item);
      //current = list[0];
      copy = [];
      copy!.addAll(list!);
      await close(data);
      return response;
    }
    catch (ex)
    {
      LogHelper.log(ex);
      data["Error"] = ex.toString();
      return response;
    }
    finally
    {
      isLoading = false;
      iScreen!.loading(Loading.REMOVE);
    }
  }

  @override
  Future<Map<String, dynamic>> delete(Map<String, dynamic> data) async
  {
    Map<String, dynamic> response = Map<String, dynamic>();
    try
    {
      isLoading = true;
      iScreen!.loading(Loading.ADD);
      data = data ?? Map<String, dynamic>();
      data = iViewModel!.load(data);
      if (data.containsKey("Entity"))
        current = data["Entity"] as T;
      if (!data.containsKey("Entity"))
        data["Entity"] = current;

      if (current == null)
        return response;
      if (!(await MessagesHelper.show(lbDeleteEntity, Message.QUESTION) as bool))
        return response;

      response = await iHelper!.delete(data);
      if (response == null || response.containsKey("Error"))
        return response;
      current = response["Entity"] as T;
      if (current != null)
      {
        list!.remove(getItem(current!));
        current = null;
        currentCopy = null;
      }
      await close(data);
      return response;
    }
    catch (ex)
    {
      LogHelper.log(ex);
      data["Error"] = ex.toString();
      return response;
    }
    finally
    {
      isLoading = false;
      iScreen!.loading(Loading.REMOVE);
    }
  }

  @override
  Future<Map<String, dynamic>> save(Map<String, dynamic> data) async
  {
    Map<String, dynamic> response = Map<String, dynamic>();
    try
    {
      isLoading = true;
      iScreen!.moveFocus();
      iScreen!.loading(Loading.ADD);

      data = data ?? Map<String, dynamic>();
      data = iViewModel!.load(data);
      if (data.containsKey("Entity"))
        currentCopy = data["Entity"] as T;
      if (!data.containsKey("Entity"))
        data["Entity"] = currentCopy;

      if (currentCopy == null)
        return response;
      if ((currentCopy as IEntities).get_Id() == 0)
      {
        response = await iHelper!.insert(data);
        if (response == null || response.containsKey("Error"))
          return response;
        currentCopy = response["Entity"] as T;
        current = currentCopy;
        list!.add(current!);
      }
      else if ((currentCopy as IEntities).get_Id() != 0 &&
        !iViewModel!.comparer(current!, currentCopy!))
      {
        response = await iHelper!.update(data);
        if (response == null || response.containsKey("Error"))
          return response;
        currentCopy = response["Entity"] as T;
        list!.remove(getItem(current!));
        list!.add(currentCopy!);
        currentCopy = null;
      }
      if (response != null || !response.containsKey("Error"))
        await close(data);
      return response;
    }
    catch (ex)
    {
      LogHelper.log(ex);
      data["Error"] = ex.toString();
      return response;
    }
    finally
    {
      isLoading = false;
      iScreen!.loading(Loading.REMOVE);
    }
  }

  @override
  Future<Map<String, dynamic>> close(Map<String, dynamic> data) async
  {
    Map<String, dynamic> response = Map<String, dynamic>();
    try
    {
      data = data ?? Map<String, dynamic>();
      data["Action"] = Action.CLOSE;
      iScreen!.change(data);
      return response;
    }
    catch (ex)
    {
      LogHelper.log(ex);
      data["Error"] = ex.toString();
      return response;
    }
  }
}