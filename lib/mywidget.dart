import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomWidget extends StatelessWidget {
  final Color? bgcolor;
  final IconData icons;
  VoidCallback? onpress;
  String? label;

  MyCustomWidget({
    this.bgcolor = Colors.grey,
    required this.icons,
    this.onpress,
    this.label = 'Hello',
  });
  @override
  Widget build(BuildContext context) {
      return Card(
        color: bgcolor,
        child: ListTile(
          title: Text(label!) ,
          leading: Icon(icons),
          onTap: onpress,
        )
      );
  }
}
