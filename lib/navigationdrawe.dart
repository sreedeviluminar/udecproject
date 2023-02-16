import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MaterialApp(
            home: Drawerrr(),
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
          )));
}

class Drawerrr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.pink),
        child: Drawer(
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1675576185701-576b56aa57fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDh8NnNNVmpUTFNrZVF8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=60"))),
                accountName: Text("Alan Paul"),
                accountEmail: Text("alanpaul@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/icons/homeicon.png"),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                      backgroundImage: AssetImage("assets/icons/homeicon.png")),
                  CircleAvatar(
                      backgroundImage: AssetImage("assets/icons/homeicon.png")),
                ],
              ),
              ListTile(
                leading: Icon(Icons.search_rounded),
                title: Text("Settings"),
              ),
              ListTile(
                leading: Icon(Icons.search_rounded),
                title: Text("Settings"),
              ),
              ListTile(
                leading: Icon(Icons.search_rounded),
                title: Text("Settings"),
              ),
              ListTile(
                leading: Icon(Icons.search_rounded),
                title: Text("Settings"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
