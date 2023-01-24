import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Login Page',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.perm_contact_cal_rounded),
                labelText: "USER",
                border: OutlineInputBorder(),
                hintText: "Username",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.remove_red_eye_rounded),
                  labelText: "PASSWORD",
                  border: OutlineInputBorder(),
                  hintText: "Password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Sign - In')),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text("Not a user ? Register Here...!!!"),
          ),
        ],
      ),
    );
  }
}
