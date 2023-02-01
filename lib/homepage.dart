import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.of(context as BuildContext).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

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
