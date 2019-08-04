import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final _borderRadius = BorderRadius.circular(24.0);
final _backgroundColorTitleAppBar = Color.fromARGB(255, 1, 117, 194);
final _backgroundColorTitle = Color.fromARGB(255, 2, 86, 155);


class InputDashboard extends StatefulWidget{
  @override
  _InputDashboardState createState()=>_InputDashboardState();
}


class _InputDashboardState extends State<InputDashboard>{

  /*TextFlied*/
  String _value = 'Cambiar: ';

  void _onChange(String value) {
    setState(() => _value = 'Cambiar: ${value}');
  }

  void _onSubmit(String value) {
    setState(() => _value = 'Cambiar: ${value}');
  }

  /*CheckBox*/

  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;

  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);
  void _value3Changed(bool value) => setState(() => _value3= value);

  Widget makeCheck() {
    List<Widget> list = new List<Widget>();
    list.add(Checkbox(value: _value1, onChanged: _value1Changed),);
    list.add(Checkbox(value: _value2, onChanged: _value2Changed),);
    list.add(Checkbox(value: _value3, onChanged: _value3Changed),);
    Row row = new Row(children: list,);
    return row;
  }

  /*Radios*/

  int _value1Radio = 0;

  void _setValue1(int value) => setState(() => _value1Radio = value);

  Widget makeRadios() {
    List<Widget> list = new List<Widget>();

    for(int i = 0; i < 3; i++){
      list.add(Radio(value: i, groupValue: _value1Radio, onChanged: _setValue1));
    }

    Row row = new Row(children: list,);
    return row;
  }

  /*Switch*/
  bool _value1S = false;
  void _onChanged1(bool value) => setState(() => _value1S = value);


  /*Slider*/
  double _valueSl = 0.0;
  void _setvalueSl(double value) => setState(() => _valueSl = value);


  /*DatePicker*/

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }




  _launchURL(String url) async {

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget MyItems(Widget wid, String heading, String url1, String url2){

    return Container(
      margin: EdgeInsets.all(16.0),
      child: Material(

        color: Colors.white,
        elevation: 14.0,
        shadowColor: _backgroundColorTitleAppBar,
        borderRadius: _borderRadius,

        child: Container(
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
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input & Selection Dashboard Flutter'),
        backgroundColor: _backgroundColorTitleAppBar,
      ),

      body:ListView(

        children: <Widget>[
          MyItems(Container(
              width: 250.0,
              height: 300.0,
              child: new Center(
                child: new Column(
                  children: <Widget>[
                    new Text(_value),

                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Normal'
                      ),
                      onChanged: _onChange,
                      onSubmitted: _onSubmit,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Password'
                      ),
                      obscureText: true,
                      onChanged: _onChange,
                      onSubmitted: _onSubmit,
                    ),


                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Cursor'
                      ),
                      cursorColor: Colors.red,
                      cursorWidth: 10.0,
                      onChanged: _onChange,
                      onSubmitted: _onSubmit,
                    ),


                    TextField(
                      decoration: new InputDecoration(
                          labelText: 'Hello',
                          hintText: 'Hint',
                          icon: new Icon(Icons.people)
                      ),
                      autocorrect: true,
                      keyboardType: TextInputType.text,
                      onChanged: _onChange,
                      onSubmitted: _onSubmit,
                    )
                  ],
                ),
              )
          ),'TextField',
              'https://docs.flutter.io/flutter/material/TextField-class.html',
              'https://github.com/JohnnHidalgo/flutter_widgetexamples/blob/master/lib/InputDashboard.dart'
          ),


          MyItems(Container(
            child: makeCheck(),
          ),'Checkbox',
              'https://docs.flutter.io/flutter/material/Checkbox-class.html',
              'https://github.com/JohnnHidalgo/flutter_widgetexamples/blob/master/lib/InputDashboard.dart'
          ),

          MyItems(Container(
            child:  makeRadios(),
          ),'RadioButton',
              'https://docs.flutter.io/flutter/material/Radio/onChanged.html',
              'https://github.com/JohnnHidalgo/flutter_widgetexamples/blob/master/lib/InputDashboard.dart'
          ),


          MyItems(Container(
            child: Switch(value: _value1S, onChanged: _onChanged1),
          ),'Switch',
              'https://docs.flutter.io/flutter/material/Switch-class.html',
              'https://github.com/JohnnHidalgo/flutter_widgetexamples/blob/master/lib/InputDashboard.dart'
          ),


          MyItems(Container(
              child: Center(
                child: new Column(
                  children: <Widget>[
                    new Text('Value: ${(_valueSl * 100).round()}'),
                    new Slider(value: _valueSl, onChanged: _setvalueSl)
                  ],
                ),
              )
          ),'Slider',
              'https://docs.flutter.io/flutter/material/Slider-class.html',
              'https://github.com/JohnnHidalgo/flutter_widgetexamples/blob/master/lib/InputDashboard.dart'
          ),

          MyItems(Container(
            width: 250.0,
            height: 105.0,
            child: Column(
              children: <Widget>[
                Text("${selectedDate.toLocal()}"),
                SizedBox(height: 20.0,),
                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select date'),
                )
              ],
            ),
          ),'Date',
              'https://docs.flutter.io/flutter/material/showDatePicker.html',
              'https://github.com/JohnnHidalgo/flutter_widgetexamples/blob/master/lib/InputDashboard.dart'
          ),

        ],
      ),
    );
  }


}