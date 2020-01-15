import 'package:flutter/material.dart';
import 'package:new_flutter_app_cec_test/consts.dart';

import 'messaging_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C&C',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: CecFonts.GoogleSans_Regular
      ),
      home: MyHomePage(title: 'Teste de aplicativo C&C'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MessagingWidget();
  }
}
