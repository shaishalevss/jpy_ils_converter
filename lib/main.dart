import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_app/ResponsiveWidget.dart';
import 'dart:convert';
import 'package:responsive_app/constants.dart';

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
  String upperval = '';
  String underVal = '';

  final myILSController = TextEditingController();
  final myJPYController = TextEditingController();

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
    myILSController.addListener(getILStoJPY);
    myJPYController.addListener(getJPYtoILS);
  }

  _printLatestValue() {
    // print("Second text field: ${myILSController.text}");
    // myILSController.text = getILStoJPY(double.parse(myILSController.text)).toString();
    // myJPYController.text = myILSController.text;
  }

  _printLatestValueTwo() {
    // print("Second text field: ${myJPYController.text}");
    // getILStoJPY(double.parse(myJPYController.text));
  }

  void getJPYtoILS() async {
    //http://api.openrates.io/latest?base=USD
    http.Response response =
        await http.get('http://api.openrates.io/latest?base=JPY');
    if (response.statusCode == 200) {
      String data = response.body;
      double lon = jsonDecode(data)['rates']['ILS'];
      print(lon);
      if (myILSController != '') {
        myILSController.text =
            (lon * double.parse(myJPYController.text)).toString();
      }
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
      if (myILSController != '') {
        myJPYController.text =
            (lon * double.parse(myILSController.text)).toString();
      }
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      appBar: null,
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/backgroundImage.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'JPY To ILS',
                  style: TextStyle(
                    color: Colors.green,
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
                        Container(
                          alignment: Alignment.centerRight,
                          width: constraints.width / 1.4,
                          height: constraints.height / 10,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFDC143C),
                              width: 3,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(80),
                            ),
                            image: DecorationImage(
                              image: ExactAssetImage('images/israel.png'),
                              fit: BoxFit.fill,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.dstATop),
                            ),
                          ),
                          child: TextField(
                            controller: myILSController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: constraints.height / 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: constraints.height / 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: constraints.width / 1.4,
                          height: constraints.height / 10,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFFDC143C),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(80),
                            ),
                            image: DecorationImage(
                              image: ExactAssetImage('images/japan.png'),
                              fit: BoxFit.fill,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.dstATop),
                            ),
                          ),
                          child: TextField(
                            controller: myJPYController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: constraints.height / 20,
                            ),
                          ),
                        ),
                      ],
                    ),
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
