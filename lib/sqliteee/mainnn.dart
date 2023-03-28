import 'package:flutter/material.dart';
import 'package:udecproject/sqliteee/SQLHelper.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var isLoading = true; // to check whether the screen have data or not

  List<Map<String, dynamic>> data_from_db = []; // list to store data from db

  void getData() async {
    // to read datas from db
    final data = await SQLHelper.readData();
    setState(() {
      data_from_db = data; // set data from db to our list
      isLoading = false;
    });
  }

  @override
  void initState() {
    // load data from db when app starts
    super.initState();
    getData();
  }

  final title = TextEditingController();
  final task = TextEditingController();

  void showForm(int? id) async {
    if (id != null) {
      final existing_data = data_from_db.firstWhere((
          element) => element['id'] == id);
      title.text = existing_data['title'];
      task.text = existing_data['task'];
    } // fetching data from the particular id for updation

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
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom + 120),
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
                        await updateItem(id);
                      }
                      title.text = "";
                      task.text = "";
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
      appBar: AppBar(title: const Text("TODo")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(null),
        child: const Icon(Icons.add),
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: data_from_db.length,
          itemBuilder: (ctx, index) {
            return Card(
              color: Colors.orange,
              child: ListTile(
                title: Text(data_from_db[index]['title']),
                subtitle: Text(data_from_db[index]['task']),
                trailing: Wrap(
                  children: [
                    IconButton(
                        onPressed: () =>
                            showForm(data_from_db[index]["id"]), // update task
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () =>
                            deleteTask(data_from_db[index]["id"]),
                        // delete task
                        icon: const Icon(Icons.delete))
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future<void> createItem() async {
    await SQLHelper.addTask(title.text, task.text);
    getData(); // for refreshing the ui when new task is added
  }

  void deleteTask(int id) async {
    await SQLHelper.deleteTask(id);
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("SuccessFully Deleted")));
    getData();
  }

  Future<void> updateItem(int id) async {
    await SQLHelper.updateTask(id, title.text, task.text);
    getData(); //refresh ui
  }
}
