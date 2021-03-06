import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'textInput.dart';

const requestUrl = "https://api.hgbrasil.com/finance";

void main() => runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(hintColor: Colors.black, primaryColor: Colors.black),
      debugShowCheckedModeBanner: false,
    ));

Future<Map> getData() async {
  http.Response response = await http.get(requestUrl);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dolar;
  double euro;

  final realController = new TextEditingController();
  final dollarController = TextEditingController();
  final euroController = TextEditingController();

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
    }

    double real = double.parse(text);
    dollarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dollarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
    }

    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
    }

    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dollarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  void _clearAll() {
    realController.text = "";
    dollarController.text = "";
    euroController.text = "";
  }

  _launchURL() async {
    const url = 'https://otaviomiguel.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Conversor",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 0.0,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              );
            default:
              dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
              euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
              return SingleChildScrollView(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      child: Icon(
                        Icons.monetization_on,
                        size: 150.0,
                        color: Colors.black,
                      ),
                      padding: EdgeInsets.all(15.0),
                    ),
                    buildTextField(
                        "Reais", "R\$ ", realController, _realChanged),
                    Divider(),
                    buildTextField(
                        "Dolares", "\$ ", dollarController, _dollarChanged),
                    Divider(),
                    buildTextField("Euros", "€ ", euroController, _euroChanged),
                    Padding(
                      padding: EdgeInsets.only(top: 150.0),
                      child: Text(
                        "Made with",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    FlutterLogo(
                      size: 50.0,
                    ),
                    FlatButton(
                      child: Text(
                        "otaviomiguel.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10.0),
                      ),
                      onPressed: _launchURL,
                    )
                  ],
                ),
              );
          }
        },
      ),
      backgroundColor: Colors.amber,
    );
  }
}
