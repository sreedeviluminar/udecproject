import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Text(
          "WELCOME USER",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40),
        ),
      ),
    );
  }
}
