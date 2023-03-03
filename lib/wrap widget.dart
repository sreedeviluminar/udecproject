import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: WrapWidgetDemo(),
      ),
    );
  }
}

class WrapWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        //height: 300,
        color: Colors.blue,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child:
        Wrap(
        //  textDirection: TextDirection.ltr,
         // direction: Axis.vertical,
          alignment: WrapAlignment.spaceEvenly,
          children: [
            MyChip("name"),
            MyChip("name"),
            MyChip("name"),
            MyChip("name"),
            MyChip("name"),
            MyChip("name"),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final String text;
  MyWidget(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 50,
      height: 50,
      color: Colors.yellow.shade700,
      child: Center(child: Text(text)),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  MyButton(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text(text),
        onPressed: () {},
      ),
    );
  }
}

class MyChip extends StatelessWidget {
  final String name;
  MyChip(this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        backgroundColor: Colors.lightGreenAccent,
        label: Text(name),
      ),
    );
  }
}