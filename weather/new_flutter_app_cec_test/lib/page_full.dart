import 'package:flutter/material.dart';
import 'package:new_flutter_app_cec_test/navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'consts.dart';

class OpenPageFull extends StatefulWidget {
  String url;
  String title;

  OpenPageFull(this.url, this.title);

  @override
  _OpenPageFullState createState() => _OpenPageFullState(url, title);
}

class _OpenPageFullState extends State<OpenPageFull> {
  String url;
  String title;
  WebViewController webcontroller;

  _OpenPageFullState(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: CecColor.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.navigate_before,
              color: Colors.white,
            ),
            onPressed: () {
              webcontroller.goBack();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.navigate_next,
              color: Colors.white,
            ),
            onPressed: () {
              webcontroller.goForward();
            },
          )
        ],
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          webcontroller = controller;
        },
      ),
    );
  }
}
