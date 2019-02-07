import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

final _borderRadius = BorderRadius.circular(24.0);
final _backgroundColorTitleAppBar = Color.fromARGB(255, 1, 117, 194);
final _backgroundColorTitle = Color.fromARGB(255, 2, 86, 155);

enum Animals{Gato, Perro, Paloma, Tigre, Jaguar}


class ButtonsDashboard extends StatefulWidget{
  @override
  _ButtonsDashboardState createState()=>_ButtonsDashboardState();
}


class _ButtonsDashboardState extends State<ButtonsDashboard>{

  Animals _selected = Animals.Gato;
  String _value = 'Make a Selection';
  List<PopupMenuEntry<Animals>> _items = new List<PopupMenuEntry<Animals>>();

  @override
  void initState() {
    for(Animals animal in Animals.values) {
      _items.add(new PopupMenuItem(
        child: new Text(_getDisplay(animal),),
        value: animal,
      ));
    }
  }
  void _onSelected(Animals animal) {
    setState((){
      _selected = animal;
      _value = 'You Selected ${_getDisplay(animal)}';
    });
  }

  String _getDisplay(Animals animal) {
    int index = animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index);
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
                    height: 45.0,//alto del Widget
                    child: Row(

                      children: <Widget>[

                        ///Documentation
                        InkWell(
                          borderRadius: _borderRadius,
                          splashColor:Colors.amberAccent,
                          highlightColor: Colors.amber,

                          onTap: (){
                            _launchURL(url1);
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

                        ///Github
                        InkWell(
                          borderRadius: _borderRadius,
                          splashColor:Colors.amberAccent,
                          highlightColor: Colors.amber,

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
              child: RaisedButton (onPressed : _onPressed, child :  new  Text ( 'Click me' ),)
          ),'RaisedButton',
              'https://docs.flutter.io/flutter/material/RaisedButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),

          MyItems(Container(
            child: IconButton (icon :  new  Icon (Icons.add), onPressed : _onPressed),
          ),'IconButton',
              'https://docs.flutter.io/flutter/material/IconButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),

          MyItems(Container(
            child: FlatButton (onPressed : _onPressed, child :  new  Text ( 'Click me' ),),
          ),'FlatButton',
              'https://docs.flutter.io/flutter/material/FlatButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),

          MyItems(Container(
            child: FloatingActionButton(onPressed: _onPressed, backgroundColor: Colors.redAccent, child: Icon(Icons.add),),
          ),'FloattingAction\n        Button',
              'https://docs.flutter.io/flutter/material/FloatingActionButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),

          MyItems(Container(
            child: PopupMenuButton<Animals>(
                child:  new Icon(Icons.input),
                initialValue: Animals.Gato,
                onSelected: _onSelected,
                itemBuilder: (BuildContext context) {
                  return _items;
                }
            ),
          ),'PopMenuViews',
              'https://docs.flutter.io/flutter/material/PopupMenuButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),
        ],

        staggeredTiles: [
          StaggeredTile.extent(2,240.0),
          StaggeredTile.extent(2,240.0),
          StaggeredTile.extent(2,240.0),
          StaggeredTile.extent(2,280.0),
          StaggeredTile.extent(2,240.0),
        ],
      ),
    );
  }

}