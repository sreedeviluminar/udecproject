import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
        home: BottomSheet2(),
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      )));
}

class BottomSheet2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: GestureDetector(
              onDoubleTap: () {
                showSheet(context);
              },
              child: const Text("Click me to show bottom sheet")),
        ));
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text("Share By",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ListTile(
                leading: Logo(Logos.whatsapp),
                title: Text("WhatsApp"),
              ),
              ListTile(
                leading: Logo(Logos.gmail),
                title: Text("Gmail"),
              ),
              ListTile(
                leading: Logo(Logos.facebook_logo),
                title: Text("Facebook"),
              ),
              ListTile(
                leading: Logo(Logos.instagram),
                title: Text("Instagram"),
              )
            ],
          ),
        )
    );
  }
}
