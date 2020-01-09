import 'package:flutter/material.dart';

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
          title: Text("Entrar na sua conta"),
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
                  child: Text("Já tenho cadastro", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),),
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
                          ),),
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
                    shape: RoundedRectangleBorder(),
                    child: Text("ENTRAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
                    shape: RoundedRectangleBorder(),
                    child: Text("ENTRAR COM FACEBOOK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    color: Color(0xFF004E88),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
