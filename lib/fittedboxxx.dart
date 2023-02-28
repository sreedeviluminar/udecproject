import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
        home: FittedBoxPage(),
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      )));
}

class FittedBoxPage extends StatefulWidget {
  @override
  _FittedBoxPageState createState() => _FittedBoxPageState();
}
class _FittedBoxPageState extends State<FittedBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FittedBox Layout Widget Demo"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         // FittedBox(
           // child:
            Card(
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "Understand With FittedBox",
                      style: TextStyle(fontSize: 20,color: Colors.black),
                    ),
                  ),
                  Container(
                    height: 200,
                    child:
                    Image.asset("assets/images/greentexture.png"),
                  ),
                ],
              ),
            ),
        //  ),
        ],
      ),
    );
  }
}