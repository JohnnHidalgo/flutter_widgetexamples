import 'package:flutter_widgetexamples/Menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgetexamples/ButtonsDashboard.dart';
import 'package:flutter_widgetexamples/InputDashboard.dart';
import 'package:flutter_widgetexamples/DialogDashboard.dart';
import 'package:flutter_widgetexamples/DisplayDashboard.dart';
import 'package:flutter_widgetexamples/ChartsDashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        routes: <String, WidgetBuilder>{
          "/inicio" : (BuildContext context) => Inicio(),
          "/buttons" : (BuildContext context) => ButtonsDashboard(),
          "/input" : (BuildContext context) => InputDashboard(),
          "/dialog" : (BuildContext context) => DialogDashboard(),
          "/diaplay" : (BuildContext context) => DisplayDashboard(),
          "/chart" : (BuildContext context) => ChartsDashboard(),
        } ,

        home: Inicio()
    );
  }
}