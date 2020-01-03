import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:esys_flutter_share/esys_flutter_share.dart';

class GifPage extends StatelessWidget {

  String title;
  String url;

  GifPage(this.title, this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              share(url);
            },
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(url),
      ),
    );
  }

  Future<void> share(String url) async {
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    await Share.file('ESYS AMLOG', 'amlog.jpg', bytes, 'image/jpg');
  }

}
