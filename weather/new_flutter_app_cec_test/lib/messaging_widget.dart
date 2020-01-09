import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter_app_cec_test/message.dart';
import 'package:new_flutter_app_cec_test/page.dart';
import 'package:new_flutter_app_cec_test/page_full.dart';

import 'consts.dart';

class MessagingWidget extends StatefulWidget {
  @override
  _MessagingWidgetState createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];

  var _mainUrl = "https://cec-b2c.cyid87hk5m-ceccasaec1-s1-public.model-t.cc.commerce.ondemand.com/cecb2cstorefront/pt/";
  String title = "Teste C&C";

  String urlFromNotification;
  String titleFromNotification;
  bool show = false;
  String token;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((token) {
      print("Token: ");
      print(token);
      this.token = token;
    });

    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print("onMessage");
      print("onMessage: $message");
      final notification = message['data'];
      show = true;
      showDialogIntern(notification);

      /*Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OpenPage(notification['urlDestino'], notification['title'])));*/

//      titleFromNotification = notification['title'];
//      urlFromNotification = notification['urlDestino'];
    }, onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch");
      final notification = message['data'];
      showDialogIntern(notification);

      /*
      setState(() {
        titleFromNotification = notification['title'];
        urlFromNotification = notification['urlDestino'];
      });*/
    }, onResume: (Map<String, dynamic> message) async {
      print("onResume");
      final notification = message['data'];
      show = true;
      showDialogIntern(notification);
    });
  }

  @override
  Widget build(BuildContext context) {
    String title, url;

    if (titleFromNotification != null && titleFromNotification.isNotEmpty) {
      title = titleFromNotification;
    } else {
      title = this.title;
    }
    if (urlFromNotification != null && urlFromNotification.isNotEmpty) {
      url = urlFromNotification;
    } else {
      url = this._mainUrl;
    }

    print(title);
    print(url);

    return OpenPageFull(url+"?tokenUserFromApp=$token&isAppUser=true", title);
  }

  showDialogIntern(notification) {
    if (!show) {
      return;
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(notification['title']),
            content: Text(notification['alertDialogContent']),
            actions: <Widget>[
              OutlineButton(
                textColor: CecColor.orange,
                child: Text("Fechar"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                },
              ),
              RaisedButton(
                color: CecColor.orange,
                child: Text("Rastrear"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OpenPage(
                              notification['urlDestino'],
                              notification['title'])));
                },
              )
            ],
          );
        });
  }

  limpar() {
    titleFromNotification = null;
    urlFromNotification = null;
    show = false;
  }
}
