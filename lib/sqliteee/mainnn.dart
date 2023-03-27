import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final title = TextEditingController();
  final task = TextEditingController();

  void showForm(int? id) async {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: title,
                  decoration: const InputDecoration(hintText: "Task Title"),
                ),
                TextField(
                  controller: task,
                  decoration: const InputDecoration(hintText: "Enter Task"),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (id == null) {
                        await createItem();
                      }
                      if (id != null) {
                        // await updateItem(id);
                      }
                      title.text = "";
                      task.text  ="";
                      Navigator.pop(context);
                    },
                    child: Text(id == null ? "Create Item" : "Update Item"))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODo")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(null),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> createItem() async {

  }
}
