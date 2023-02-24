import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
            home: BottomSheetmain(),
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
          )));
}

class BottomSheetmain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const RiveAnimation.network(
        "https://cdn.rive.app/animations/vehicles.riv",
        fit: BoxFit.cover,
      ),
      Center(
        child: GestureDetector(
            onDoubleTap: () {
              showSheet(context);
            },
            child: const Text("Click me to show bottom sheet")),
      ),
    ]));
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text("Share"),
                  ),
                  ListTile(
                    leading: Icon(Icons.copy),
                    title: Text("Copy"),
                  )
                ],
              ),
            ));
  }
}

