import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_widgetexamples/Sales.dart';
import 'package:charts_flutter/flutter.dart'as charts;

final _borderRadius = BorderRadius.circular(24.0);
final _backgroundColorTitleAppBar = Color.fromARGB(255, 1, 117, 194);
final _backgroundColorTitle = Color.fromARGB(255, 2, 86, 155);


class ChartsDashboard extends StatefulWidget{
  @override
  _ChartsDashboardState createState()=>_ChartsDashboardState();
}


class _ChartsDashboardState extends State<ChartsDashboard>{

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

                        ///Documentation
                        InkWell(

                          borderRadius: _borderRadius,//curva
                          splashColor:Colors.amberAccent,//color al presionar tiempo corto
                          highlightColor: Colors.amber,//color al presionar tiempo largo, puede cabiar por Colors.blue para notar la diferencia

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


    var data = [
      Sales('Lun', 50),
      Sales('Mar', 40),
      Sales('Mie', 30),
      Sales('Jue', 60),
      Sales('Vie', 50),
    ];

    var series =[
      charts.Series(
          domainFn: (Sales sales,_)=>sales.day,
          measureFn: (Sales sales,_)=>sales.sold,

          id: 'Sales',
          data: data
      )
    ];
    ///chart
    var chart = charts.BarChart(
      series,
      animate: true,
    );
    ///cart1
    var chart1 = charts.BarChart(
      series,
      vertical: false,
      animate: true,
    );
    ///chart2
    var chart2 = charts.PieChart(
      series,
      defaultRenderer: charts.ArcRendererConfig(
          arcRendererDecorators: [charts.ArcLabelDecorator()]
      ),
    );




    return Scaffold(
      appBar: AppBar(
        title: Text('Input & Selection Dashboard Flutter'),
        backgroundColor: _backgroundColorTitleAppBar,
      ),

      body:StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

        children: <Widget>[

          MyItems(Container(
            width: 250.0,
            height: 300.0,
            child: Padding(
              padding: new EdgeInsets.all(32.0),
              child: new SizedBox(
                height: 200.0,
                child: chart,
              ),
            ),

          ),'BarChart',
              'https://docs.flutter.io/flutter/material/RaisedButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),

          MyItems(Container(
            width: 250.0,
            height: 300.0,
            child: Padding(
              padding: new EdgeInsets.all(32.0),
              child: new SizedBox(
                height: 200.0,
                child: chart1,
              ),
            ),

          ),'BarChart ',
              'https://docs.flutter.io/flutter/material/IconButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),


          MyItems(Container(
            width: 250.0,
            height: 300.0,
            child: Padding(
              padding: new EdgeInsets.all(32.0),
              child: new SizedBox(
                height: 200.0,
                child: chart2,
              ),
            ),
          ),'Piechart',
              'https://docs.flutter.io/flutter/material/FlatButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),


        ],


        staggeredTiles: [
          StaggeredTile.extent(2,500.0),
          StaggeredTile.extent(2,500.0),
          StaggeredTile.extent(2,500.0),
        ],
      ),
    );
  }


}