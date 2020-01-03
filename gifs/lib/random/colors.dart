import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomColor() {
  Random random = Random();
  switch(random.nextInt(10)) {
    case 0:
      return Colors.white;
    case 1:
      return Colors.blue;
    case 2:
      return Colors.green;
    case 3:
      return Colors.red;
    case 4:
      return Colors.yellow;
    case 5:
      return Colors.purple;
    case 6:
      return Colors.pink;
    case 7:
      return Colors.orange;
    case 8:
      return Colors.teal;
    case 9:
      return Colors.amber;
    case 10:
      return Colors.greenAccent;
  }
}