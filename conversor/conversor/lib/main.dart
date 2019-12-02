import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const requestUrl = "";

void main() async {

  runApp(Home());
}

Future<Map> getData() async {
  http.Response response = await http.get(requestUrl);
  return json.decode(response.body)["results"]["currencies"]["USD"];
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
        title: Text("Conversor"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
    );
  }
}
