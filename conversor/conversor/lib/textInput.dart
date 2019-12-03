import 'package:flutter/material.dart';

Widget buildTextField(String label, String prefix,
    TextEditingController controller, Function function) {
  return TextField(
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        prefixText: prefix,
        prefixStyle: TextStyle(color: Colors.black)),
    style: TextStyle(color: Colors.black),
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    controller: controller,
    onChanged: function,
  );
}