import 'package:flutter/material.dart';
import 'package:new_flutter_app_cec_test/page.dart';

import 'consts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Entrar na sua conta", style: TextStyle(fontFamily: CecFonts.Montserrat_Bold),),
          centerTitle: true,
          backgroundColor: CecColor.orange,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Já tenho cadastro",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: CecFonts.Montserrat_Bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Email ou CPF/CNPJ cadastrado*"),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: CecColor.orange),
                          ),
                          hintText: "meuemail@email.com"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Senha*"),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: CecColor.orange),
                        ),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text(
                      "ENTRAR",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat-Bold'),
                    ),
                    color: CecColor.orange,
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text(
                      "ENTRAR COM FACEBOOK",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat-Bold'),
                    ),
                    color: Color(0xFF004E88),
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 50.0,
                  child: OutlineButton(
                    borderSide: BorderSide(color: CecColor.orange, width: 2.0),
                    child: Text(
                      "CADASTRAR",
                      style: TextStyle(
                          color: CecColor.orange,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat-Bold'),
                    ),
                    color: CecColor.orange,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Cadastrar-se"),
                              content: Text(
                                  "Você será redirecionado a nossa loja para se cadastrar com a gente ;)"),
                              actions: <Widget>[
                                OutlineButton(
                                  borderSide: BorderSide(
                                      color: CecColor.orange, width: 2.0),
                                  textColor: CecColor.orange,
                                  child: Text("Cancelar"),
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop('dialog');
                                  },
                                ),
                                RaisedButton(
                                  color: CecColor.orange,
                                  child: Text("Continuar"),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OpenPage(
                                                "https://cec-b2c.cyid87hk5m-ceccasaec1-s1-public.model-t.cc.commerce.ondemand.com/cecb2cstorefront/pt/login",
                                                "Cadastro")));
                                  },
                                )
                              ],
                            );
                          });
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
