import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udecproject/hiveLogin%20using%20HiveAdapter/database/DBFunction.dart';
import 'package:udecproject/hiveLogin%20using%20HiveAdapter/model/user_model.dart';

import 'Home.dart';
import 'Registration.dart';

class Login extends StatelessWidget {
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
              onPressed: () async {
                final userlist = await DataBasee.instance.getUser();
                checkUser(userlist); // check the enter value if found in db list

                email.text = "";
                pass.text  = "";
              },
              child: const Text("Login")),
          const SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: () {
                Get.to(() => Register());
              },
              child: const Text("Not A user? Register!!"))
        ],
      ),
    );
  }

  Future<void> checkUser(List<User> userlist) async {
    final mail = email.text.trim();
    final pwd = pass.text.trim();
    bool isUserFound = false;
    final validateEmpty = await ValidateLogin(mail, pwd);

    if (validateEmpty == true) {
      await Future.forEach(userlist, (users) {
        if (users.email == mail && users.password == pwd) {
          isUserFound = true;
        } else {
          isUserFound = false;
        }
      });
      if (isUserFound == true) {
        Get.offAll(() => Home(email: mail));
        Get.snackbar("Success", "Logined as $mail");
      } else {
        Get.snackbar("Failes", "Login Failed");
      }
    } else {
      Get.snackbar('Error', 'Fields must not be empty');
    }
  }

  Future<bool> ValidateLogin(String mail, String pwd) async {
    if (mail != '' && pwd != '') {
      return true;
    } else {
      //  Get.snackbar('Error', 'Fields must not be empty');
      return false;
    }
  }
}
