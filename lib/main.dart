import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_app/ResponsiveWidget.dart';
import 'dart:convert';
import 'package:responsive_app/constants.dart';
import 'package:responsive_app/widgets/text_field_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myILSController = TextEditingController();
  final myJPYController = TextEditingController();
  double val = 0;
  double val2 = 0;
  bool currentState = true;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myILSController.dispose();
    myJPYController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    myJPYController.addListener(getILStoJPY);
    myILSController.addListener(getILStoJPY);
    myJPYController.text = '0';
    myILSController.text = '0';
  }

  void getJPYtoILS() async {
    //http://api.openrates.io/latest?base=USD
    http.Response response =
        await http.get('http://api.openrates.io/latest?base=JPY');
    if (response.statusCode == 200) {
      String data = response.body;
      double lon = jsonDecode(data)['rates']['ILS'];
      print(lon);
      print('HEYYYYY');
      val2 = lon;
      print(lon * double.parse(myJPYController.text));
    } else {
      print(response.statusCode);
    }
  }

  void getILStoJPY() async {
    //http://api.openrates.io/latest?base=USD
    http.Response response =
        await http.get('http://api.openrates.io/latest?base=ILS');
    if (response.statusCode == 200) {
      String data = response.body;
      double lon = jsonDecode(data)['rates']['JPY'];
      print(lon);
      val = lon;
      print(lon * double.parse(myILSController.text));
    } else {
      print(response.statusCode);
    }
  }

  void changeVisibility() {
    currentState = !currentState;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      appBar: null,
      builder: (context, constraints) {
        return Container(
          decoration: kMainContainerDecoration,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'JPY To ILS',
                  style: TextStyle(
                    color: Color(0xFFFFFFF0),
                    fontFamily: 'Knewave',
                    fontSize: constraints.height / 15,
                  ),
                ),
                SizedBox(
                  height: constraints.height / 41,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              changeVisibility();
                              myJPYController.text = '0';
                              myILSController.text = '0';
                            });
                          },
                          child: Visibility(
                            visible: currentState,
                            child: Container(
                              width: constraints.width / 5,
                              height: constraints.height / 10,
                              decoration: kArrowLeftDownDecoration,
                            ),
                          ),
                        ),
                        TextFieldContainer(
                          controller: myILSController,
                          width: constraints.width / 1.4,
                          height: constraints.height / 10,
                          image: ExactAssetImage('images/israel.png'),
                          alignment: Alignment.centerRight,
                          fontSize: constraints.height / 20,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(80),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: constraints.height / 41,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFieldContainer(
                          controller: myJPYController,
                          width: constraints.width / 1.4,
                          height: constraints.height / 10,
                          image: ExactAssetImage('images/japan.png'),
                          alignment: Alignment.centerLeft,
                          fontSize: constraints.height / 20,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(80),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              changeVisibility();
                              myJPYController.text = '0';
                              myILSController.text = '0';
                            });
                          },
                          child: Visibility(
                            visible: !currentState,
                            child: Container(
                              width: constraints.width / 5,
                              height: constraints.height / 10,
                              decoration: kArrowRightUpDecoration,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: constraints.height/81,
                    ),
                    RaisedButton(
                        child: Text("Convert"),
                        elevation: 5,
                        color: Colors.green,
                        padding: EdgeInsets.all(12.0),
                        splashColor: Colors.yellow[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        onPressed: () {
                          setState(() {
                            if (myILSController.text == '0' ||
                                myJPYController.text == '0') {
                              return;
                            } else {
                              if (currentState) {
                                getILStoJPY();
                                myJPYController.text = (val * double.parse(myILSController.text)).toString();
                              } else if(!currentState) {
                                getJPYtoILS();
                                myILSController.text = (val2 * double.parse(myJPYController.text)).toString();
                              }
                            }
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
