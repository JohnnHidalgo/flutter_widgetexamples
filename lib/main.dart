import 'package:flutter_widgetexamples/Menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgetexamples/ButtonsDashboard.dart';
import 'package:flutter_widgetexamples/InputDashboard.dart';
import 'package:flutter_widgetexamples/DialogDashboard.dart';
import 'package:flutter_widgetexamples/DisplayDashboard.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        } ,

        home: Inicio()
    );
  }
}

class Empresa extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("EMPRESA"),),
      body: Center(
        child: Text("SECCIÓN EMPRESA"),
      ),
    );
  }
}
class Productos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("PRODUCTOS"),),
      body: Center(
        child: Text("SECCIÓN PRODUCTOS"),
      ),
    );
  }
}
class Contacto extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("CONTACTO"),),
      body: Center(
        child: Text("SECCIÓN CONTACTO"),
      ),
    );
  }
}


