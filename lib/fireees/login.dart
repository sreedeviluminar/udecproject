import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:udecproject/fireees/FireHelper.dart';
import 'package:udecproject/fireees/homee.dart';
import 'package:udecproject/fireees/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: FireLogin(),
  ));
}

class FireLogin extends StatefulWidget {
  @override
  State<FireLogin> createState() => _FireLoginState();
}

class _FireLoginState extends State<FireLogin> {
  final mail = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: mail,
          ),
          TextField(
            controller: pass,
          ),
          ElevatedButton(
              onPressed: () {
                String eemail = mail.text.trim();
                String pwd = pass.text.trim();

                AuthHelper()
                    .signIn(email: eemail, password: pwd)
                    .then((result) {
                  if (result == null) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Homee()));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(result)));
                  }
                });
                mail.text = "";
                pass.text ="";
              },
              child: Text("Login")),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FireSignUp()));
              },
              child: Text("Sign UP Here!!"))
        ],
      ),
    ));
  }
}
