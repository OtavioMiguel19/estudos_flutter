import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:gifs/random/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search != null && _search.isEmpty) {
      _search = null;
      _offset = 0;
    }

    if (_search == null) {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=YZHMJzvERYuORfsjD4DNkY4agK1xcJlN&limit=25&rating=G");
    } else {
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=YZHMJzvERYuORfsjD4DNkY4agK1xcJlN&q=$_search&limit=25&offset=$_offset&rating=G&lang=en");
    }
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    Color destaque = getRandomColor();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: destaque, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: destaque, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: destaque, width: 2.0),
                ),
                labelText: "Pesquise aqui",
                labelStyle: TextStyle(color: destaque),
              ),
              style: TextStyle(
                color: destaque,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
              onSubmitted: (text) {
                setState(() {
                  _search = text;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5.0,
                      ),
                    );
                  default:
                    if (snapshot.hasError)
                      return Container();
                    else
                      return _createGifTable(context, snapshot);
                }
              },
              future: _getGifs(),
            ),
          )
        ],
      ),
    );
  }

  int _getCount(List data) {
    if (_search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        itemCount: _getCount(snapshot.data["data"]),
        itemBuilder: (context, index) {
          if (_search == null || index < snapshot.data["data"].length) {
            Color color = getRandomColor();
            return GestureDetector(
              child: Image.network(
                snapshot.data["data"][index]["images"]["fixed_height"]["url"],
                height: 300.0,
                fit: BoxFit.cover,
                loadingBuilder: (context, widget, event) {
                  if (event == null) {
                    return widget;
                  }
                  return Container(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      strokeWidth: 5.0,
                      value: event.expectedTotalBytes != null
                          ? event.cumulativeBytesLoaded /
                              event.expectedTotalBytes
                          : null,
                    ),
                    alignment: Alignment.center,
                  );
                },
              ),
            );
          } else {
            return Container(
              child: GestureDetector(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 70.0,
                      ),
                      Text(
                        "Carregar mais...",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    _offset += 24;
                  });
                },
              ),
            );
          }
        });
  }
}
