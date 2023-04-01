import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final String email;

  Home({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome $email"),
      ),
    );
  }
}
