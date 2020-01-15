import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'consts.dart';

class OpenPage extends StatelessWidget {

  String url;
  String title;
  String oldtitle;
  WebViewController webcontroller;

  OpenPage(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontFamily: CecFonts.Montserrat_Bold)),
        centerTitle: true,
        backgroundColor: CecColor.orange,
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
