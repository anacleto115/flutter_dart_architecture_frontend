// ignore_for_file: avoid_print
// ignore_for_file: prefer_const_constructors
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: prefer_collection_literals
// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';
import 'flt_persons/Core/MessageFL.dart';
import 'flt_persons/MainWindow.dart';
import 'flt_persons/Styles/Style.dart';
import 'lib_communication_context/Core/FactoryCallerContext.dart';
import 'lib_domain_context/FactoryCaller.dart';
import 'lib_domain_context/LogHelper.dart';
import 'lib_domain_context/MessagesHelper.dart';
import 'lib_language/Bundle.dart';

void main() {
  var app = MyApp();
  app.execute();
  runApp(app);
}

/* // ADD THIS ON PUBSPEC.YAML
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  format: ^1.1.0
  event: ^2.1.2
  sprintf: ^7.0.0
  mysql1: ^0.20.0
  mongo_dart: ^0.9.1
  xml: ^5.4.1
  http: ^1.1.0
  dart_amqp: ^0.2.5
  mailer: ^6.0.1
  udp: ^5.0.3
  dart_eval: ^0.6.0
  logger: ^2.0.2+1
  libserialport: ^0.2.0+3
  watcher: ^1.1.0
  dart_des: ^1.0.2
  encrypt: ^5.0.3
  image: ^3.1.3
  file_picker: ^4.3.0
*/

class MyApp extends StatelessWidget
{
  MyApp({super.key});

  execute() async
  {
    try
    {
      Bundle.load("Es");
      MessagesHelper.set(MessageFL());
      FactoryCaller.iFactoryCaller = FactoryCallerContext();
      Style.load();
    }
    catch (ex)
    {
      LogHelper.log(ex);
    }
  }

  // For WEB Remember activate WIFI
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        title: 'Persons - Flutter/Dart',
        home: MainWindow(),
        theme: ThemeData(colorScheme: Style.appStyle)
    );
  }
}