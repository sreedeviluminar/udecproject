import 'package:flutter/material.dart';

class List_With_Builder extends StatelessWidget{

  var datas =<String>['Data 1','Data 2','Data 3','Data 4','Data 5'];
  var color = <int>[800,700,500,300,100];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("ListView with Builder")),
        body: ListView.builder(
            itemCount: datas.length,
            itemBuilder: (BuildContext,index){
              return Container(
                height: 100,
                color: Colors.red[color[index]],
                child: Text(datas[index]),
              );
            }),
      );
  }

}