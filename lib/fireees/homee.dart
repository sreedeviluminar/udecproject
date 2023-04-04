import 'package:flutter/material.dart';

import 'FireHelper.dart';
import 'login.dart';

class Homee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Welcome"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthHelper().signOut().then((_) =>
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => FireLogin())));
        },
        child: const Text("SignOut"),
      ),
    );
  }
}
