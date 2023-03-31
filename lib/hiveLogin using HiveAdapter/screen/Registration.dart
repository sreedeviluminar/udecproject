import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udecproject/hiveLogin%20using%20HiveAdapter/model/user_model.dart';

class Register extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "UserName",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pass,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                validateSignUp();
              },
              child: const Text("Register")),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  void validateSignUp() async {
    final mail = email.text.trim();
    final pwd = pass.text.trim();

    final emailvalidation = EmailValidator.validate(mail);

    if (mail != "" && pwd != "") {
      if (emailvalidation == true) {
        final passvalidation = checkPassword(pwd);
        if(passvalidation == true){
          final user = User(email :mail ,password :pwd);
        }
      }
    }
  }

  bool checkPassword(String pwd) {
    if (pwd.length < 6) {
      Get.snackbar("Error", "Password length should be greater than 6");
      return false;
    } else {
      return true;
    }
  }
}
