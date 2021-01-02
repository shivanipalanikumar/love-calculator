import 'package:flutter/material.dart';
import 'package:love_calc/Models/reponse.dart';
import './services/percentageservice.dart';
//hello
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isloading = false;
  String percentage = "";
  String result = "";
  TextEditingController malecontroller = TextEditingController();
  TextEditingController femalecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Love Calculator"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            //color: Colors.green,
            height: 300,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: malecontroller,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Male name',
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: femalecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Female name',
                  ),
                ),
                const SizedBox(height: 30),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () async {
                    setState(() {
                      _isloading = true;
                    });
                    final Response call = await calculateLove(
                        malecontroller.text, femalecontroller.text);
                    setState(() {
                      percentage = call.percentage;
                      result = call.result;
                      _isloading = false;
                    });
                  },
                  child: const Text('Submit'),
                ),
                Text(_isloading ? "Loading..." : percentage),
                Text(_isloading ? "" : result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
