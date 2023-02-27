import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
        home: ExpansionTilleee(),
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      )));
}
class ExpansionTilleee extends StatelessWidget {
  var colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.pink
  ];
  List datas = ["Red", "Green", "Blue", "Yellow", "Pink"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EXPANSION TILE'),
      ),
      body: ExpansionTile(
        title: const Text("Colors"),
        subtitle: const Text("List of Colors"),
        children: List.generate(5,
            (index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: colors[index],
                  ),
                  title: Text(datas[index]),
                )),
      ),
    );
  }
}
