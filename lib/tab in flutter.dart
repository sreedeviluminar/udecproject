import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: Color(0xff2e7d32))
        ),
        home: TabEx(),
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      )));
}

class TabEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
     length: 4,
     child: Scaffold(
       appBar: AppBar(
         title: Text("WhatsApp"),
         actions: const [
           Icon(Icons.camera_alt),
           SizedBox(width: 20,),
           Icon(Icons.search),
           SizedBox(width: 20,),
           Icon(Icons.more_vert),
         ],
         bottom: const TabBar(tabs: [
           Tab(icon: Icon(Icons.people),),
           Tab(text: "Chats",),
           Tab(text: "Status",),
           Tab(text: "Call",)
         ]),
       ),
       body: const TabBarView(
         children: [
           Center(child: Text("Community"),),
           Center(child: Text("CHATS"),),
           Center(child: Text("STATUS"),),
           Center(child: Text("CALL"),),
         ],
       ),

       floatingActionButton: FloatingActionButton(onPressed: () {  },
       child: const Icon(Icons.message),),
     ),
   );
  }
}
