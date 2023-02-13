import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'homepage.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
        home: _RegistrationPageState(),
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      )));
}

class _RegistrationPageState extends StatefulWidget {
  @override
  State<_RegistrationPageState> createState() => _RegistrationPageStateState();
}

class _RegistrationPageStateState extends State<_RegistrationPageState> {
  var formkey = GlobalKey<FormState>();
  var showpass = true;
  var showpass2 = true;
  var confirmpassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration With Validation"),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            const Text(
              "Login Page",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 20, bottom: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'username',
                    prefixIcon: Icon(Icons.account_box_sharp),
                    border: OutlineInputBorder()),
                validator: (username) {
                  if (username!.isEmpty || !username.contains('@')) {
                    return 'Enter a Valid email';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
              child: TextFormField(
                obscureText: showpass,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: "password",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (showpass) {
                              showpass = false;
                            } else {
                              showpass = true;
                            }
                          });
                        },
                        icon: Icon(showpass == true
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    border: OutlineInputBorder()),
                validator: (password) {
                  confirmpassword = password;
                  if (password!.isEmpty || password.length < 6) {
                    return 'Not a valid password';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
              child: TextFormField(
                obscureText: showpass2,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (showpass2) {
                              showpass2 = false;
                            } else {
                              showpass2 = true;
                            }
                          });
                        },
                        icon: Icon(showpass2 == true
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    border: OutlineInputBorder()),
                validator: (cpassword) {
                  if (cpassword!.isEmpty || cpassword.length < 6 || confirmpassword != cpassword) {
                    return 'Not  valid  or password mismatch';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  final valid = formkey.currentState!.validate();
                  if (valid) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    Fluttertoast.showToast(
                        msg: "Login Failed",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER_RIGHT,
                        //timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                },
                child: const Text("LOGIN"))
          ],
        ),
      ),
    );
  }
}
