import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Contador de pessoas', home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _i = 0;
  String text = "Pode entrar!";

  void _change(int delta) {
    setState(() {
      _i += delta;

      if (_i > 10) {
        text = "lotado!";
        _i = 11;
      } else if (_i < 0) {
        _i = 0;
      } else {
        text = "Pode entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Text("Draw"),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/razer.png",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                child: Text(
                  "Pessoas: $_i",
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      onPressed: () {
                        _change(1);
                      },
                    ),
                    FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      onPressed: () {
                        _change(-1);
                      },
                    )
                  ],
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "$text",
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
