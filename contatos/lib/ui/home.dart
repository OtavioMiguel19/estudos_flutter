import 'package:contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ContactHelper helper = ContactHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.purple,
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.purple,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.purple,),
        tooltip: "Adicionar contato",
        backgroundColor: Colors.white,
        onPressed: () {},
      ),
    );
  }
}
