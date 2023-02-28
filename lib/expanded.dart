import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
        home: MyApp(),
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height:MediaQuery.of(context).size.height,
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Hello"),
            Icon(Icons.account_box_sharp),
            Expanded(
                child: Image(
             // height: double.infinity,
              image: AssetImage(
                "assets/images/greentexture.png",
              ),
              fit: BoxFit.cover,
            ))
          ],
        ),
      ),
    );
  }
}
