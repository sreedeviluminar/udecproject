import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(MaterialApp(
    home: Clips(),
  ));
}

class Clips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRect(
                child: Align(
                  widthFactor: .7,
                  heightFactor: .8,
                  alignment: Alignment.center,
                  child: Image.network(
                      "https://images.unsplash.com/photo-1537511446984-935f663eb1f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(600),
                child: Image.network(
                    "https://images.unsplash.com/photo-1597589827317-4c6d6e0a90bd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
              ),
              ClipOval(
                child: Image.network(
                    "https://plus.unsplash.com/premium_photo-1669613588943-e74363ef75c2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHNxdWFyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"),
              ),
              ClipPath(
                clipper: WaveClipperTwo(flip: true,reverse: true),
                child: Image.network("https://images.unsplash.com/photo-1677598233344-258f6b595d8a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80"),)
            ],
          ),
        ),
      ),
    );
  }
}
