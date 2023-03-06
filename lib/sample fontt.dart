import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      home: MyAppfont(),
      theme: ThemeData(
          //fontFamily: 'Shantell_Sans'
     ),
    ));

class MyAppfont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HElloooo"),
        ),
        body: Center(
          child: Text(
            "Hello All Welcome to Luminar",
            style: GoogleFonts.actor(
              textStyle: Theme.of(context).textTheme.labelLarge,
              fontSize: 48,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ))
            // TextStyle(fontFamily: 'Shantell_Sans', fontSize: 35),),

        ));
  }
}
