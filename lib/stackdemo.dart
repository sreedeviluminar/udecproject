import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
            home: StackDemo(),
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
          )));
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              color: Colors.pink,
              width: 250,
              height: 500,
            ),
            Positioned(
              left: 20,
              bottom: 50,
              child: Container(
                color: Colors.black12,
                width: 200,
                height:200,
              ),
            ),
            const Positioned(
              right: 10,
              top: 30,
              child: Icon(
                Icons.star,
                color: Colors.yellowAccent,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
