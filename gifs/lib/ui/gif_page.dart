import 'package:flutter/material.dart';
import 'package:share/share.dart';

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
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> share(String url) async {
//    var request = await HttpClient().getUrl(Uri.parse(url));
//    var response = await request.close();
//    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
//    await Share.file('ESYS AMLOG', 'amlog.jpg', bytes, 'image/jpg');
    Share.share(url);
  }
}
