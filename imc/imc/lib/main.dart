import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
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
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.purple,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.person_outline,
            size: 120.0,
            color: Colors.white,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso (Kg)",
              labelStyle: TextStyle(color: Colors.white),
              fillColor: Colors.white,
              focusColor: Colors.white,
              hoverColor: Colors.white,
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),

          )
        ],
      ),
    );
  }
}
