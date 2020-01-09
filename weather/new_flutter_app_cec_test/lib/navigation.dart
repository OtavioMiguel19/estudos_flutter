import 'package:flutter/material.dart';
import 'package:new_flutter_app_cec_test/login.dart';
import 'package:new_flutter_app_cec_test/page.dart';

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
                    child: Image.network(
                        "https://www.televendasecobranca.com.br/wp-content/uploads/2017/09/CEC-casa-e-construcao-adota-conceito-multicanalidade-integrado-de-vendas-televendas-cobranca.jpg"),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Text("Teste de aplicativo C&C"),
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
        ],
      ),
    );
  }
}
