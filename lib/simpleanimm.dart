import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 12.0, end: 100.0).animate(controller!)
      ..addListener(() {
        setState(() {});
      });
  }

  void increaseSize() {
    controller!.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "Hello All",
              style: TextStyle(fontSize: animation?.value),
            ),
          ),
          ElevatedButton(onPressed: () => increaseSize(), child: Text("Zoommm"))
        ],
      ),
    );
  }
}
