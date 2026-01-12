// ignore_for_file: avoid_init_to_null
// ignore_for_file: curly_braces_in_flow_control_structures
import '../../../lib_domain_context/Enumerables.dart';
import '../../../lib_domain_context/LogHelper.dart';
import '../../../lib_domain_entities/Models/PersonTypes.dart';
import '../../../lib_presentation_core/Core/FactoryHelper.dart';
import '../../../lib_presentation_core/Interfaces/VwModels/IPersonTypesViewModel.dart';
import '../../Core/VModel.dart';

class PersonTypesViewModel extends IPersonTypesViewModel
{
  VModel<PersonTypes>? vModel = null;

  PersonTypesViewModel(Map<String, dynamic> data)
  {
    vModel = VModel<PersonTypes>(data);
    vModel!.iViewModel = this;
  }

  @override void setCurrent(PersonTypes? v) { vModel!.current = v; }
  @override PersonTypes? getCurrent() { return vModel!.current; }
  @override void setCurrentCopy(PersonTypes? v) { vModel!.currentCopy = v; }
  @override PersonTypes? getCurrentCopy() { return vModel!.currentCopy; }
  @override void setList(List<PersonTypes>? v) { vModel!.list = v; }
  @override List<PersonTypes>? getList() { return vModel!.list; }

  @override
  Map<String, dynamic> load(Map<String, dynamic> data)
  {
    try
    {
      data = vModel!.load(data);
      data["Type"] = Types.PersonTypes;
      if (!data.containsKey("IHelper"))
        vModel!.iHelper = vModel!.iHelper ?? FactoryHelper.get(data);
    }
    catch (ex)
    {
      LogHelper.log(ex);
    }
    return data;
  }

  @override
  Future<Map<String, dynamic>> select(Map<String, dynamic> data) async
  {
    return await vModel!.select(data);
  }

  @override
  Future<Map<String, dynamic>> newOne(Map<String, dynamic> data) async
  {
    return await vModel!.newOne(data);
  }

  @override
  Future<Map<String, dynamic>> modify(Map<String, dynamic> data) async
  {
    return await vModel!.modify(data);
  }

  @override
  Future<Map<String, dynamic>> save(Map<String, dynamic> data) async
  {
    return await vModel!.save(data);
  }

  @override
  Future<Map<String, dynamic>> delete(Map<String, dynamic> data) async
  {
    return await vModel!.delete(data);
  }

  @override
  Future<Map<String, dynamic>> close(Map<String, dynamic> data) async
  {
    return await vModel!.close(data);
  }

  @override PersonTypes createNew() { return PersonTypes(); }
}