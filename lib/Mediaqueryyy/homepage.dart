import 'package:flutter/material.dart';
import 'package:udecproject/Mediaqueryyy/responsive/desktop_body.dart';
import 'package:udecproject/Mediaqueryyy/responsive/mobile_body.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ! fetch device width
    var deviceWidth = MediaQuery.of(context).size.width;
    // !
    if (deviceWidth < 600) {
      return  MyMobileBody();
    } else {
      return const MyDesktopBody();
    }
  }
}
