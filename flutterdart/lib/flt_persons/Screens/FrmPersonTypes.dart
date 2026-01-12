// ignore_for_file: prefer_const_constructors
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: prefer_collection_literals
// ignore_for_file: prefer_interpolation_to_compose_strings
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: avoid_init_to_null
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import '../../lib_domain_context/IViewModel.dart';
import '../../lib_domain_context/LogHelper.dart';
import '../../lib_domain_entities/Models/PersonTypes.dart';
import '../../lib_language/Bundle.dart';
import '../../lib_presentation_context/Implementations/VwModels/PersonTypesViewModel.dart';
import '../Core/ScreenFake.dart';
import '../Styles/Style.dart';

class FrmPersonTypes extends StatefulWidget
{
  FrmPersonTypes({super.key});

  @override
  State<FrmPersonTypes> createState() => StateFrmPersonTypes();
}

class StateFrmPersonTypes extends State<FrmPersonTypes>
{
  IViewModel<PersonTypes>? viewModel = null;
  bool loaded = false,
    listDetail = true;

  @override
  void initState()
  {
    super.initState();
    try
    {
      if (viewModel != null)
        return;
      var data = Map<String, dynamic>();
      data["View"] = this;
      data["View"] = ScreenFake();
      viewModel = PersonTypesViewModel(data);
    }
    catch (ex)
    {
      LogHelper.log(ex);
    }
  }

  Future userControl_Loaded() async
  {
    try
    {
      if (loaded || viewModel == null)
        return;
      await btSelect();
      loaded = true;
      setState(() { });
    }
    catch (ex)
    {
      LogHelper.log(ex);
    }
  }

  @override
  Widget build(BuildContext context)
  {
    var screen = SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: <Widget>[
            Text(
              Bundle.get("RsPersonTypes", "lbTitle"),
              style: Style.titles
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  style: Style.buttons,
                    onPressed: null,
                    child: Text(Bundle.get("RsMenu", "lbInsert")),
                ),
                SizedBox(width: 2),
                TextButton(
                  style: Style.buttons,
                  onPressed: null,
                  child: Text(Bundle.get("RsMenu", "lbSave")),
                ),
                SizedBox(width: 2),
                TextButton(
                  style: Style.buttons,
                  onPressed: null,
                  child: Text(Bundle.get("RsMenu", "lbUpdate")),
                ),
                SizedBox(width: 2),
                TextButton(
                  style: Style.buttons,
                  onPressed: null,
                  child: Text(Bundle.get("RsMenu", "lbDelete")),
                ),
                SizedBox(width: 2),
                TextButton(
                  style: Style.buttons,
                  onPressed: () { btSelect(); },
                  child: Text(Bundle.get("RsMenu", "lbSelect")),
                ),
                SizedBox(width: 2),
                TextButton(
                  style: Style.buttons,
                  onPressed: null,
                  child: Text(Bundle.get("RsMenu", "lbClose")),
                ),
              ],
            ),

            SizedBox(height: 10),
            if (listDetail)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                      height: 500.0,
                      child: SingleChildScrollView(
                        child: DataTable(
                            headingRowColor: MaterialStateColor.resolveWith((states) => Style.mainColor!),
                            dataRowMaxHeight: double.infinity,       // Code to be changed.
                            dataRowMinHeight: 60,
                            showCheckboxColumn: false,
                            columns: getColumns(),
                            rows: viewModel!.getList()!.map(
                              (x) => DataRow(
                                  onSelectChanged: (s) { setState(() { viewModel!.setCurrent(x); }); },
                                  cells: getCells(x)
                              ),
                            ).toList()
                        ),
                      )
                  )
                ],
              ),
          ]
        )
      ),
    );

    return FutureBuilder(
        future: userControl_Loaded(),
        builder: (context, snapshot) { return screen; }
    );
  }

  List<DataColumn> getColumns()
  {
    List<DataColumn> response = [];
    response.add(DataColumn(label: Text(Bundle.get("RsPersonTypes", "clName"))));
    return response;
  }

  List<DataCell> getCells(PersonTypes x)
  {
    List<DataCell> response = [];
    response.add(DataCell(Text(x.getName())));
    return response;
  }

  Future btSelect() async
  {
    try
    {
      if (viewModel == null)
        return;
      var data = Map<String, dynamic>();
      var response = await viewModel!.select(data);
      if (response == null || response.containsKey("Error"))
        return;
      setState(() { });
    }
    catch (ex)
    {
      LogHelper.log(ex);
    }
  }
}