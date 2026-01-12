// ignore_for_file: prefer_const_constructors
// ignore_for_file: sized_box_for_whitespace
// ignore_for_file: prefer_interpolation_to_compose_strings
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: avoid_init_to_null
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: avoid_unnecessary_containers
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import '../lib_language/Bundle.dart';
import '../lib_domain_context/MessagesHelper.dart';
import 'Core/MessageFL.dart';
import 'Screens/FrmPersonTypes.dart';
import 'GlobalData.dart';
import 'Styles/Style.dart';

class MainWindow extends StatefulWidget
{
  const MainWindow({ super.key });

  @override
  State<MainWindow> createState() => StateMainWindow();
}

class StateMainWindow extends State<MainWindow>
{
  static State<MainWindow>? stateMainWindow = null;
  int form = 0;

  @override
  Widget build(BuildContext context)
  {
    stateMainWindow = this;
    MessageFL.context = context;
    detectDevice(context);
    var scanfoldKey = GlobalKey<ScaffoldState>();

    return DefaultTabController(
      initialIndex: form,
      length: getOptions().length,
      child: Scaffold(
        key: scanfoldKey,
        appBar: getMenu(scanfoldKey, context),
        body: getScreen(),
        drawer: getMenuLateral(context),
        bottomNavigationBar: getBottom(context)
      ),
    );
  }

  void detectDevice(BuildContext context)
  {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    GlobalData.rightMenu = shortestSide < 600;
  }

  AppBar getMenu(GlobalKey<ScaffoldState> key, BuildContext context)
  {
    var tabs = TabBar(
      isScrollable: true,
      onTap: (index) {
        form = index;
        setState(() { });
      },
      tabs: <Widget>[
        for (var i = 0; i < getOptions().length; i++)
          Container(width: 120.0,
              child: Tab(text: Bundle.get("RsMenu", getOptions()[i]))
          ),
      ],
    );

    var bar =  AppBar(
      leading: IconButton(
        icon: Icon(null, size: 15.0),
        onPressed: () { }
      ),
      toolbarHeight: 20,
      bottom: tabs
    );

    if (!GlobalData.rightMenu)
      return bar;

    bar =  AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu, size: 15.0),
        onPressed: () { key.currentState!.openDrawer(); }
      ),
      toolbarHeight: 45
    );
    return bar;
  }

  Widget getScreen()
  {
    return FrmPersonTypes();
  }

  Drawer? getMenuLateral(BuildContext context)
  {
    if (!GlobalData.rightMenu)
      return null;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 20),
          Text(
              Bundle.get("RsMenu", "lbMenu"),
              textAlign: TextAlign.center,
              style: Style.labels
          ),

          for (var i = 0; i < getOptions().length; i++)
            getLatMenu(i, context),
        ],
      ),
    );
  }

  getLatMenu(int index, BuildContext context)
  {
    return ListTile(
      title: Text(
        Bundle.get("RsMenu", getOptions()[index]),
        style: Style.labels
      ),
      onTap: () {
        form = index;
        setState(() { });
        Navigator.pop(context);
      }
    );
  }

  Container getBottom(BuildContext context)
  {
    return Container(
      child: BottomNavigationBar(
        selectedItemColor: Style.textColor,
        unselectedItemColor: Style.textColor,
        backgroundColor: Style.mainColor,
        iconSize: 10.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'Menu 1',
              icon: Icon(Icons.menu)
          ),
          BottomNavigationBarItem(
              label: 'Menu 2',
              icon: Icon(Icons.menu_open)
          ),
          BottomNavigationBarItem(
              label: 'Menu 3',
              icon: Icon(Icons.menu_book_rounded)
          ),
        ],
        onTap: (int index) { bottomAction(index, context); },
      )
    );
  }

  void bottomAction(int index, BuildContext context) async
  {
    if (index != 2)
      return;
    await MessagesHelper.show(
      Bundle.get("RsMenu", "lbKeyToClose")
    );
  }

  List getOptions()
  {
      return [ 'lbPersonTypes' ];
  }
}