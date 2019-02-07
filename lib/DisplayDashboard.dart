import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgetexamples/ItemInfo.dart';
import 'dart:math';

final _borderRadius = BorderRadius.circular(24.0);//para la curva de InkWell
final _backgroundColorTitleAppBar = Color.fromARGB(255, 1, 117, 194);
final _backgroundColorTitle = Color.fromARGB(255, 2, 86, 155);

class  DisplayDashboard extends StatefulWidget{
  @override
  _DiplayDashboardState createState()=>_DiplayDashboardState();
}


class _DiplayDashboardState extends State<DisplayDashboard>{
  ///Chip

  int counter = 0;
  List<Widget> _list = new List<Widget>();

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  ///DATA TABLE
  void _getSelectedRowInfo() {
    print('Selected Item Row Name Here...');
  }


  var items = <ItemInfo>[
    ItemInfo(
      itemName: 'Item A',
      itemPrice: '250',
    ),
    ItemInfo(
      itemName: 'Item B',
      itemPrice: '100',
    ),
    ItemInfo(
      itemName: 'Item C',
      itemPrice: '150',
    ),
  ];


  void _onClicked() {
    Widget child = _newItem(counter);
    setState(() => _list.add(child));
  }

  Widget _newItem(int i)  {
    Key key = new Key('item_${i}');
    Container child = new Container(
      key: key,
      padding: new EdgeInsets.all(10.0),
      child: new Chip(
        label: new Text('${i} Name here'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => _removeItem(key),
        avatar: new CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: new Text(i.toString()),
        ),
      ),
    );

    counter++;
    return child;
  }

  void _removeItem(Key key) {
    for(int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if(child.key == key) {
        setState(() => _list.removeAt(i));
        print('Removing ${key.toString()}');
      }
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
                            print('Hello InkWell');
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
                            print('Hello InkWell');
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
            width: 300.0,
            height: 300.0,
            child: Center(

              child: Image.asset('assets/Logo.png'),

            ),
          ),'Image',
              'https://docs.flutter.io/flutter/material/IconButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),


          MyItems(Container(
            width: 180.0,
            height: 180.0,
            child: Center(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(IconData(0xeb3b, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe190, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe84e, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe84f, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe851, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe60e, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe439, fontFamily: 'MaterialIcons')),

                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(IconData(0xe003, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe0e8, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe567, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe854, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe05c, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe195, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xeb3c, fontFamily: 'MaterialIcons')),

                    ],

                  ),
                  Row(
                    children: <Widget>[
                      Icon(IconData(0xeb3d, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe0e6, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe859, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe5c3, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe5c6, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe85c, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe85d, fontFamily: 'MaterialIcons')),

                    ],

                  ),
                  Row(
                    children: <Widget>[
                      Icon(IconData(0xe862, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe3a0, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe226, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe3a1, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe1a3, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xeb3e, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe1a7, fontFamily: 'MaterialIcons')),

                    ],

                  ),
                  Row(
                    children: <Widget>[
                      Icon(IconData(0xe866, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe3a8, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe1ad, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe869, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xeb3f, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe7e9, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe3af, fontFamily: 'MaterialIcons')),

                    ],

                  ),
                  Row(
                    children: <Widget>[
                      Icon(IconData(0xe3b0, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe5c9, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe8f6, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xeb40, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe308, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe3b5, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe0ca, fontFamily: 'MaterialIcons')),

                    ],

                  ),
                  Row(
                    children: <Widget>[
                      Icon(IconData(0xe834, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe86c, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe2bd, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe3b6, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe14d, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe872, fontFamily: 'MaterialIcons')),
                      Icon(IconData(0xe875, fontFamily: 'MaterialIcons')),

                    ],

                  )

                ],
              ),

            ),

          ),'Icon',
              'https://docs.flutter.io/flutter/material/IconButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),


          MyItems(Container(
            child:  Center(
              child:  Column(
                children: _list,
              ),
            ),
          ),'Chip',
              'https://docs.flutter.io/flutter/material/IconButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),



          MyItems(Container(
            child: DataTable(
              onSelectAll: (b) {},
              sortAscending: true,
              columns: <DataColumn>[
                DataColumn(
                  label: Text('Item'),
                ),
                DataColumn(
                  label: Text('Price'),
                ),
              ],
              rows: items
                  .map(
                    (itemRow) => DataRow(
                  cells: [
                    DataCell(
                      Text(itemRow.itemName),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(itemRow.itemPrice),
                      showEditIcon: true,
                      placeholder: false,
                      onTap: _getSelectedRowInfo,
                    ),
                  ],
                ),
              )
                  .toList(),
            ),
          ),'Datatable',
              'https://docs.flutter.io/flutter/material/IconButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),


          MyItems(Container(
            child: Center(
                child: Column(
                  children: <Widget>[
                    new Card(
                      child: new Container(
                        padding: new EdgeInsets.all(32.0),
                        child: new Column(
                          children: <Widget>[
                            new Text('Hello World!'),
                            new Text('How are you?')
                          ],
                        ),
                      ),
                    ),

                    new Card(
                      child: new Container(
                        padding: new EdgeInsets.all(32.0),
                        child: new Column(
                          children: <Widget>[
                            Container(
                              width: 150.0,
                              height: 150.0,
                              child: Center(

                                child: Image.asset('assets/Logo.png'),

                              ),
                            ),
                            new Text('Flutter Logo')
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ), 'Card',
              'https://docs.flutter.io/flutter/material/IconButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),


          MyItems(Container(
              width: 300.0,
              height: 300.0,
              child: GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this would produce 2 rows.
                crossAxisCount: 2,
                // Generate 100 Widgets that display their index in the List
                children: List.generate(10, (index) {
                  return Center(
                    child: Image.asset('assets/Logo.png'),

                  );
                }),
              )

          ),


              'GridView',
              'https://docs.flutter.io/flutter/material/IconButton-class.html',
              'https://github.com/JohnnHidalgo/udacity_navigation_state/blob/master/lib/ButtonsDashboard.dart'
          ),




          /*
        */

        ],


        staggeredTiles: [
          StaggeredTile.extent(2,480.0),
          StaggeredTile.extent(2,380.0),
          StaggeredTile.extent(2,500.0),
          StaggeredTile.extent(2,400.0),
          StaggeredTile.extent(2,500.0),
          StaggeredTile.extent(2,500.0),

        ],
      ),
    );
  }


}