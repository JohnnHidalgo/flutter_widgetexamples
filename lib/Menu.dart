import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


final _backgroundColorTitle = Color.fromARGB(255, 2, 86, 155);
final _rowHeight = 120.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Inicio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final listView =  Container(
      child: ListView(
        children: <Widget>[

          Column(
          children: <Widget>[

            Container(
            height: _rowHeight,
            child: InkWell(
              borderRadius: _borderRadius,
              splashColor:Colors.amberAccent,
              highlightColor: Colors.amber,

              onTap:() {
                Navigator.pushNamed(context, "/buttons");
              },

              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.apps,
                        size: 60.0,
                      ),
                    ),
                    Center(
                      child: Text('Button Windgets',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline,),
                    ),

                  ],
                ),

              ),
            ),
          ),


          Container(
            height: _rowHeight,
            child: InkWell(
              borderRadius: _borderRadius,
              splashColor:Colors.amberAccent,
              highlightColor: Colors.amber,

              onTap:() {
                Navigator.pushNamed(context, "/input");
              },

              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.input,
                        size: 60.0,
                      ),
                    ),
                    Center(
                      child: Text('Input & Selection Windgets',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline,),
                    ),

                  ],
                ),

              ),
            ),
          ),


          Container(
            height: _rowHeight,
            child: InkWell(
              borderRadius: _borderRadius,
              splashColor:Colors.amberAccent,
              highlightColor: Colors.amber,

              onTap:() {
                Navigator.pushNamed(context, "/dialog");
              },

              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.view_day,
                        size: 60.0,
                      ),
                    ),
                    Center(
                      child: Text('Dialogs, Alerts and panels',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline,),
                    ),

                  ],
                ),

              ),
            ),
          ),

          Container(
            height: _rowHeight,
            child: InkWell(
              borderRadius: _borderRadius,
              splashColor:Colors.amberAccent,
              highlightColor: Colors.amber,

              onTap:() {
                Navigator.pushNamed(context, "/diaplay");
              },

              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.view_quilt,
                        size: 60.0,
                      ),
                    ),
                    Center(
                      child: Text('Displays',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline,),
                    ),

                  ],
                ),

              ),
            ),
          ),




          ],
        )

        ],
      ),


    );



    final appBar = AppBar(
      elevation: 5.0,
      backgroundColor: _backgroundColorTitle,
      title: Text(
        'Flutter Examples',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );

  }
}