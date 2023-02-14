import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
        home: LottieAnim(),
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      )));
}

class LottieAnim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
              end: Alignment.bottomCenter,
              colors: [
            Colors.deepPurpleAccent,
            Colors.white30,
            Colors.black
          ])
        ),
        child: ListView(
          children: [
            Lottie.asset('assets/animm/cute-panda.json'),
            Lottie.network("https://assets2.lottiefiles.com/packages/lf20_DyDkQs.json"),
          ],
        ),
      )
      ,
    );
  }
}
