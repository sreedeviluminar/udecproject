import 'package:flutter/material.dart';
import 'package:udecproject/passing%20data%20between%20screens/dummy_data.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final productId = ModalRoute.of(context)?.settings.arguments; // id from previous page
    final product = dummyProducts.firstWhere((element) => element["id"] == productId);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Product"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 300,
              decoration:
                  BoxDecoration(image: DecorationImage(
                     fit: BoxFit.cover,
                      image: NetworkImage(product["image"]))),
            ),
            Text("${product["name"]}"),
            Text("${product["description"]}"),
            Text("${product["price"]}"),
            Text("${product["rating"]}"),

          ],
        ),
      ),
    );
  }
}
