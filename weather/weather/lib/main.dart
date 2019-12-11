import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text("Curitiba - PR"),
            ),
            Text("Atualizado",
            style: TextStyle(fontSize: 12.0),)
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        elevation: 0.0,

      ),
      backgroundColor: Colors.lightBlueAccent,
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "12",
                      style: TextStyle(fontSize: 100.0, color: Colors.white, fontWeight: FontWeight.w100),
                    ),
                    Padding(
                      child: Text(
                        "ºC",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                  ],
                ),
                Padding(
                  child: Text(
                    "Nublado",
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  padding: EdgeInsets.only(left: 20.0),
                ),
              ],
            )
          )
        ],
      ),
    ));
  }
}
