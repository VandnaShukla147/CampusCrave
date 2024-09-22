import 'package:flutter/material.dart';
import 'package:roll_dice/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Scaffold(
        body: GradientContainer([
          Color.fromARGB(255, 89, 6, 102),
          Color.fromRGBO(113, 16, 139, 1),
          Color.fromARGB(147, 189, 62, 212),
        ]),
      ),
    ),
  );
}
