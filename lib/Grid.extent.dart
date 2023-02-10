import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
            home: Grid_extent(),
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
          )));
}

class Grid_extent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
        maxCrossAxisExtent: 70,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          Container(
            child: Column(
              children: [
                Text("IMAGE 1"),
                Image.asset("assets/icons/homeicon.png",width: 50,height: 40,)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("IMAGE 2"),
                Image.asset("assets/icons/apple.png",width: 50,height: 40)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("IMAGE 1"),
                Image.asset("assets/icons/homeicon.png",width: 50,height: 40,)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("IMAGE 2"),
                Image.asset("assets/icons/apple.png",width: 50,height: 40)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("IMAGE 1"),
                Image.asset("assets/icons/homeicon.png",width: 50,height: 40,)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("IMAGE 2"),
                Image.asset("assets/icons/apple.png",width: 50,height: 40)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("IMAGE 1"),
                Image.asset("assets/icons/homeicon.png",width: 50,height: 40,)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("IMAGE 2"),
                Image.asset("assets/icons/apple.png",width: 50,height: 40)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("IMAGE 1"),
                Image.asset("assets/icons/homeicon.png",width: 50,height: 40,)
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("IMAGE 2"),
                Image.asset("assets/icons/apple.png",width: 50,height: 40)
              ],
            ),
          )
        ],
      ),
    );
  }
}
