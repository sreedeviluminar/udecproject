import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udecproject/hiveLogin%20using%20HiveAdapter/database/DBFunction.dart';
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
              onPressed: () async{
                final userlist = await DataBasee.instance.getUser();
                validateSignUp(userlist);
                email.text = "";
                pass.text  = "";
              },
              child: const Text("Register")),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
  void validateSignUp(List<User> userlist) async {
    final mail = email.text.trim();
    final pwd = pass.text.trim();
    bool isUserFound = false;
    final emailvalidation = EmailValidator.validate(mail);

    if (mail != "" && pwd != "") {
      if (emailvalidation == true) {
 /// check user is already registered
        await Future.forEach(userlist, (users) {
          if (users.email == mail) {
            isUserFound = true;
          } else {
            isUserFound = false;
          }
        });
        if(isUserFound == true){
          Get.snackbar("Error", "User already Registered");
        }else {
          final passvalidation = checkPassword(pwd);
          if (passvalidation == true) {
            final user = User(email: mail, password: pwd);
            await DataBasee.instance.userSignUp(user);
            Get.back();
            Get.snackbar("Success", "Account Created");
          }
        }
      } else {
        Get.snackbar("Error", "Please provide valid email ",
            colorText: Colors.red);
      }
    } else {
      Get.snackbar("Error", "Fields cannot be empty", colorText: Colors.red);
    }
  }

  bool checkPassword(String pwd) {
    if (pwd.length < 6) {
      Get.snackbar("Error", "Password length should be greater than 6",
          colorText: Colors.red);
      return false;
    } else {
      return true;
    }
  }
}
