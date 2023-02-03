import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:udecproject/List_Separator.dart';
import 'package:udecproject/UI/phonelist.dart';
import 'ListView_With_Builder.dart';
import 'loginpage.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
            home: SplashScreen(),
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
          )));
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PhoneList()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///body as column/ multichild widget
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // color: Colors.greenAccent,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/greentexture.png"))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Icon(
              //   Icons.ac_unit,
              //   size: 100,
              // ),
              ///adding asset image
              Image(
                image: AssetImage("assets/icons/homeicon.png"),
                width: 200,
                height: 200,
              ),

              ///adding network image
              // Image(
              //   image: NetworkImage(
              //       "https://llandscapes-10674.kxcdn.com/wp-content/uploads/2015/01/6198521760_aa86027669_z.jpg"),
              //   width: 200,
              //   height: 200,
              // ),

              Text(
                "MY HOME",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),

      ///body as text in center
      // body: Center(
      //     child: Text(
      //   "MY APPLICATION",
      //   style: TextStyle(
      //       fontSize: 30,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.orange ),
      // )),
      ///body as icon in center
      // body: Center(
      //   child: Icon(
      //     Icons.contrast_sharp,
      //     size: 80,
      //     color: Colors.pink,
      //   ),
      // ),
    );
  }
}
