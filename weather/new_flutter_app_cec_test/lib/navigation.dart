import 'package:flutter/material.dart';
import 'package:new_flutter_app_cec_test/login.dart';
import 'package:new_flutter_app_cec_test/page.dart';
import 'package:url_launcher/url_launcher.dart' as LAUNCHER;

import 'consts.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    child: Image.network(CecStrings.logo),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Text(""),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              title: Row(
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    color: CecColor.orange,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Olá, Otavio",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
//          Container(
//            child: ListTile(
//              title: Row(
//                children: <Widget>[
//                  Icon(
//                    Icons.person_outline,
//                    color: Colors.deepOrangeAccent,
//                  ),
//                  Padding(
//                    padding: EdgeInsets.only(left: 12.0),
//                    child: Text(
//                      "Entre",
//                      style: TextStyle(color: Colors.deepOrangeAccent),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
          Divider(),
          Container(
            color: const Color(0xFFFFE0B5),
            child: ListTile(
              title: Row(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: CecColor.orange,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Início',
                      style: TextStyle(color: CecColor.orange),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.dialpad,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Calculadoras',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OpenPage(
                          "https://cec-b2c.cyid87hk5m-ceccasaec1-s1-public.model-t.cc.commerce.ondemand.com/cecb2cstorefront/pt/calculators",
                          "Calculadoras")));
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.store,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Nossas lojas',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OpenPage(
                          "https://cec-b2c.cyid87hk5m-ceccasaec1-s1-public.model-t.cc.commerce.ondemand.com/cecb2cstorefront/pt/nossas-lojas/lojas/SP",
                          "Nossas lojas")));
            },
          ),
          Divider(),
          //====================================================================
          // Contatos
          //====================================================================
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Televendas',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pop(context);
              LAUNCHER.launch("tel:1140010100");
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'SAC',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            onTap: () async {
              Navigator.pop(context);
              await LAUNCHER.launch("tel:1140010100");
            },
          ),

        ],
      ),
    );
  }
}
