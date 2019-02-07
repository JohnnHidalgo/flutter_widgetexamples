import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_widgetexamples/Expanded.dart';
import 'package:url_launcher/url_launcher.dart';

final _borderRadius = BorderRadius.circular(24.0);//para la curva de InkWell
final _backgroundColorTitleAppBar = Color.fromARGB(255, 1, 117, 194);
final _backgroundColorTitle = Color.fromARGB(255, 2, 86, 155);

class DialogDashboard extends StatefulWidget{
  @override
  _DialogDashboardState createState()=>_DialogDashboardState();
}


class _DialogDashboardState extends State<DialogDashboard>{

  ///SimpleDialog
  String _value = '.......';


  void _setValue(String value) => setState(() => _value = value);

  Future _askUser() async {
    switch(
    await showDialog(
        context: context,
        child: new SimpleDialog(
          title: new Text('Te gusta Flutter'),
          children: <Widget>[
            new SimpleDialogOption(child: new Text('Si!!!'),onPressed: (){_setValue('Si');},),
            new SimpleDialogOption(child: new Text('No :('),onPressed: (){_setValue('No');},),
            new SimpleDialogOption(child: new Text('Masomenos :('),onPressed: (){_setValue('Masomenos');},),
          ],
        )
    )
    )

    {
    }
  }


  ///AlertDialog
  String _value1='.......';

  void _setValue1(String value) => setState(() => _value1 = value);

  Future _showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            new FlatButton(onPressed: (){_setValue1('Genial');}, child: new Text('Ok'))
          ],
        )

    );
  }

  ///BottonSheet

  void _showBottom() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: <Widget>[
                new Text('Some info here', style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                new RaisedButton(onPressed: () => Navigator.pop(context), child: new Text('Close'),)
              ],
            ),
          );
        }
    );
  }

  ///SnackBar
  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();

  void _showbar() {
    _scaffoldstate.currentState.showSnackBar(new SnackBar(content: new Text('Hello world')));
  }

  ///ExpandedPanel
  List<MyExpanded> _itemsExpanded = new List<MyExpanded>();

  @override
  void initState() {
    for(int i = 0 ; i< 5; i++) {
      _itemsExpanded.add(new MyExpanded(
          false,
          'Item ${i}',
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Text('Hello World'),
          )
      ));
    }
  }

  ExpansionPanel _createitem(MyExpanded item) {
    return new ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return new Container(
            padding: new EdgeInsets.all(5.0),
            child: new Text('Header ${item.header}'),
          );
        },
        body: item.body,
        isExpanded: item.isExpanded

    );
  }



  void  _onPressed () {
    setState (() {
    });
  }


  _launchURL(String url) async {

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  Material MyItems(Widget wid, String heading, String url1, String url2){

    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: _backgroundColorTitleAppBar,
      borderRadius: _borderRadius,

      child: Center(

        child: Padding(

          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,


            children: <Widget>[

              Column(

                children: <Widget>[

                  Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ///Text
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(heading,
                          style: TextStyle(
                            color: _backgroundColorTitle,
                            fontSize: 40.0,
                          ),
                        ),
                      ),
                      ///Windget
                      Material(
                        borderRadius:  _borderRadius,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: wid,
                        ),
                      ),


                    ],

                  ),


                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),

                    //color: Color.fromARGB(255, 19, 185, 253),
                    height: 45.0,//alto del Widget
                    child: Row(

                      children: <Widget>[


                        InkWell(
                          borderRadius: _borderRadius,//curva
                          splashColor:Colors.amberAccent,//color al presionar tiempo corto
                          highlightColor: Colors.amber,//color al presionar tiempo largo, puede cabiar por Colors.blue para notar la diferencia

                          onTap: (){
                            _launchURL(url2);
                          },

                          child: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.zero,
                                  child: Icon(
                                    Icons.library_books,
                                    size: 25.0,
                                  ),
                                ),

                                Center(
                                  child: Text(
                                    'Documentation',
                                    style: Theme.of(context).textTheme.headline,
                                  ),

                                ),

                              ],

                            ),
                          ),

                        ),

                        InkWell(
                          borderRadius: _borderRadius,//curva
                          splashColor:Colors.amberAccent,//color al presionar tiempo corto
                          highlightColor: Colors.amber,//color al presionar tiempo largo, puede cabiar por Colors.blue para notar la diferencia

                          onTap: (){
                            _launchURL(url2);
                          },

                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.zero,

                                  child : Image.asset('assets/GitHub0.png'),
                                ),

                                Center(
                                  child: Text(
                                    'Github',
                                    style: Theme.of(context).textTheme.headline,
                                  ),

                                ),

                              ],

                            ),
                          ),

                        ),
                      ],
                    ),

                  )




                ],

              )
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Dashborad Flutter'),
        backgroundColor: _backgroundColorTitleAppBar,
      ),

      body:StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

        children: <Widget>[

          MyItems(Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(_value),
                    RaisedButton(onPressed: _askUser, child: new Text('Click me'),)
                  ],
                ),
              )
          )
              ,'SimpleDialog',
              'https://docs.flutter.io/flutter/material/IconButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),


          MyItems(Container(
            child:  Center(
              child: new Column(
                children: <Widget>[
                  Text(_value1),
                  RaisedButton(onPressed: () => _showAlert(context, 'Do you like flutter, I do!'), child: new Text('Click me'),)
                ],
              ),
            ),
          ),'AlertDialog',
              'https://docs.flutter.io/flutter/material/IconButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),



          MyItems(Container(
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new Text('Add Widgets Here'),
                  new RaisedButton(onPressed: _showBottom, child: new Text('Click me'),)
                ],
              ),
            ),
          ),'BottonSheet',
              'https://docs.flutter.io/flutter/material/IconButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),


          MyItems(Container(
            width: 300.0,
            height: 300.0,
            child: ListView(
              children: <Widget>[
                new ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _itemsExpanded[index].isExpanded = !_itemsExpanded[index].isExpanded;
                    });
                  },
                  children: _itemsExpanded.map(_createitem).toList(),
                )
              ],
            ),
          ),'Expancion Panel',
              'https://docs.flutter.io/flutter/material/IconButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),

        ],


        staggeredTiles: [
          StaggeredTile.extent(2,240.0),
          StaggeredTile.extent(2,240.0),
          StaggeredTile.extent(2,240.0),
          StaggeredTile.extent(2,500.0),
//          StaggeredTile.extent(2,240.0),


        ],
      ),
    );
  }


}