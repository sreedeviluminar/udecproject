import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:udecproject/fireees/FireHelper.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: FireSignUp(),
  ));
}

class FireSignUp extends StatefulWidget {
  @override
  State<FireSignUp> createState() => _FireSignUpState();
}

class _FireSignUpState extends State<FireSignUp> {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: email,
            ),
            TextField(
              controller: pass,
            ),
            ElevatedButton(
              onPressed: () {
                String mail = email.text.trim();
                String pwd = pass.text.trim();

                AuthHelper().signUp(email: mail, password: pwd).then((result) {
                  if (result == null) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => FireLogin()));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(result)));
                  }
                });
              },
              child: Text("SignUp"),
            )
          ],
        ),
      ),
    );
  }
}
