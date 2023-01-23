import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///body as column/ multichild widget
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Icon(
            //   Icons.ac_unit,
            //   size: 100,
            // ),
            ///adding asset image
            Image(image: AssetImage("assets/icons/homeicon.png"),width: 100,height: 100,),
            Text(
              "MY APPLICATION",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            )
          ],
        ),
      ),





      ///body as text in center
      // body: Center(
      //     child: Text(
      //   "MY APPLICATION",
      //   style: TextStyle(
      //       fontSize: 30,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.orange ),
      // )),
      ///body as icon in center
      // body: Center(
      //   child: Icon(
      //     Icons.contrast_sharp,
      //     size: 80,
      //     color: Colors.pink,
      //   ),
      // ),
    );
  }
}
