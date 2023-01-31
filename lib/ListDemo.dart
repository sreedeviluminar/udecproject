import 'package:flutter/material.dart';

class ListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Center(
              child: Text(
            "My Contacts",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          Card(
              color: Colors.red,
              child: ListTile(
                //leading: Icon(Icons.person),
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1491616569293-e27f7f4cd41a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmFjayUyMG9mJTIwZ2lybHxlbnwwfHwwfHw%3D&w=1000&q=80")),
                title: Text("Name 1"),
                subtitle: Text("90876654531"),
                trailing: Wrap(
                    children: const [
                      Icon(Icons.message),
                      SizedBox(width: 20,),
                      Icon(Icons.phone)
                    ]),
              )),
        ],
      ),
    );
  }
}
