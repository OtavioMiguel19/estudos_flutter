import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

const appid = "c00fe224c75dac1775522ab4b3a3e430";
const baseUrl = "http://api.openweathermap.org/data/2.5/forecast?q=";
const baseUrlNow =
    "http://dataservice.accuweather.com/currentconditions/v1/44944?apikey=AAzGRlIPtEDrO6LKL9fGnHl7G8MnsKYw&language=pt-br&details=false";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Future<Map> getData() async {
//  final url = baseUrl + city + "&appid=" + appid + "&units=metric&lang=pt_br";
  final url =
      "http://dataservice.accuweather.com/forecasts/v1/daily/5day/44944?apikey=AAzGRlIPtEDrO6LKL9fGnHl7G8MnsKYw&language=pt-br&metric=true&details=true";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

Future<List<String>> getCurrentData() async {
//  final url = baseUrl + city + "&appid=" + appid + "&units=metric&lang=pt_br";
  final url =
      "http://dataservice.accuweather.com/currentconditions/v1/44944?apikey=AAzGRlIPtEDrO6LKL9fGnHl7G8MnsKYw&language=pt-br&details=false";
  http.Response response = await http.get(url);
  List<String> values = [];
  if (!response.body.isEmpty) {
    values.add(json
        .decode(response.body)[0]["Temperature"]["Metric"]["Value"]
        .toStringAsPrecision(2));
    values.add(json.decode(response.body)[0]["WeatherText"]);
  }
  return values;
}

String getDayOfWeek(int day) {
  if (day == 1) {
    return "Dom";
  } else if (day == 2) {
    return "Seg";
  } else if (day == 3) {
    return "Ter";
  } else if (day == 4) {
    return "Qua";
  } else if (day == 5) {
    return "Qui";
  } else if (day == 6) {
    return "Sex";
  } else if (day == 7) {
    return "Sab";
  }
  return "";
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
                child: Text("Curitiba"),
              ),
              Text(
                "Atualizado",
                style: TextStyle(fontSize: 12.0),
              )
            ],
          ),
            backgroundColor: Colors.lightBlue,
          centerTitle: true,
          elevation: 0.0,
        ),
          backgroundColor: Colors.lightBlue,
        body: FutureBuilder<List<String>>(
          future: getCurrentData(),
          builder: (context, snapshot1) {

            switch (snapshot1.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                var _current = "";
                var _current_text = "";
                if (snapshot1.data != null && snapshot1.data.isNotEmpty) {
                  _current = snapshot1.data[0];
                  _current_text = snapshot1.data[1];
                }

                return FutureBuilder<Map>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.error != null) {
                      return Padding(
                        child: Center(
                          child: Text("Erro de conexão. Verifique sua rede e tente novamente"),
                        ),
                        padding: EdgeInsets.all(20.0),
                      );
                    }

                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        var _today_max = "";
                        var _today_min = "";
                        var _today_state = "";
                        var _tomorrow_max = "";
                        var _tomorrow_min = "";
                        var _tomorrow_state = "";
                        var _day2_max = "";
                        var _day2_min = "";
                        var _day2_state = "";

                        if (snapshot.data != null) {
                          _today_max = snapshot.data["DailyForecasts"][0]
                          ["Temperature"]["Maximum"]["Value"]
                              .toStringAsPrecision(2);
                          _today_min = snapshot.data["DailyForecasts"][0]
                          ["Temperature"]["Minimum"]["Value"]
                              .toStringAsPrecision(2);
                          _today_state = snapshot.data["DailyForecasts"][0]
                          ["Day"]["ShortPhrase"];
                          _tomorrow_max = snapshot.data["DailyForecasts"][1]
                          ["Temperature"]["Maximum"]["Value"]
                              .toStringAsPrecision(2);
                          _tomorrow_min = snapshot.data["DailyForecasts"][1]
                          ["Temperature"]["Minimum"]["Value"]
                              .toStringAsPrecision(2);
                          _tomorrow_state = snapshot.data["DailyForecasts"]
                          [1]["Day"]["ShortPhrase"];
                          _day2_max = snapshot.data["DailyForecasts"][2]
                          ["Temperature"]["Maximum"]["Value"]
                              .toStringAsPrecision(2);
                          _day2_min = snapshot.data["DailyForecasts"][2]
                          ["Temperature"]["Minimum"]["Value"]
                              .toStringAsPrecision(2);
                          _day2_state = snapshot.data["DailyForecasts"][2]
                          ["Day"]["ShortPhrase"];
                        }

                        var twodaysfromnow = DateTime.now().add(Duration(days: 3)).weekday;

                        return SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            _current,
                                            style: TextStyle(
                                                fontSize: 100.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w100),
                                          ),
                                          Padding(
                                            child: Text(
                                              "ºC",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white),
                                            ),
                                            padding: EdgeInsets.only(top: 15.0),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        child: Text(
                                          _current_text,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white),
                                        ),
                                        padding: EdgeInsets.only(
                                            left: 10.0, bottom: 300.0),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            "Mais detalhes >",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.0),
                                          ),
                                        ],
                                      ),
                                      Card(
                                        color: Colors.blue,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(15.0)),
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.cloud,
                                                    color: Colors.white,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      child: Text(
                                                        "Hoje - $_today_state",
                                                        style: TextStyle(
                                                            color:
                                                            Colors.white),
                                                      ),
                                                      padding:
                                                      EdgeInsets.all(15.0),
                                                    ),
                                                  ),
                                                  Text(
                                                    "$_today_maxº / $_today_minº",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              padding: EdgeInsets.all(10.0),
                                            ),
                                            Padding(
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.cloud,
                                                    color: Colors.white,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      child: Text(
                                                        "Amanhã - $_tomorrow_state",
                                                        style: TextStyle(
                                                            color:
                                                            Colors.white),
                                                      ),
                                                      padding:
                                                      EdgeInsets.all(15.0),
                                                    ),
                                                  ),
                                                  Text(
                                                    "$_tomorrow_maxº / $_tomorrow_minº",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              padding: EdgeInsets.all(10.0),
                                            ),
                                            Padding(
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.cloud,
                                                    color: Colors.white,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      child: Text(
                                                        getDayOfWeek(twodaysfromnow) + " - $_day2_state",
                                                        style: TextStyle(
                                                            color:
                                                            Colors.white),
                                                      ),
                                                      padding:
                                                      EdgeInsets.all(15.0),
                                                    ),
                                                  ),
                                                  Text(
                                                    "$_day2_maxº / $_day2_minº",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              padding: EdgeInsets.all(10.0),
                                            ),
                                            Padding(
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "Previsão para 5 dias",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13.0),
                                                  ),
                                                ],
                                              ),
                                              padding:
                                              EdgeInsets.only(bottom: 15.0),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        );
                    }
                  },
                );
            }
          },
        ));
  }

  @override
  void initState() {
    super.initState();
  }
}
