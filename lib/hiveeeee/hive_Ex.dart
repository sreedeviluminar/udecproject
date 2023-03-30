import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('todo_box');
  runApp(MaterialApp(home: MyToDO()));
}

class MyToDO extends StatefulWidget {
  @override
  State<MyToDO> createState() => _MyToDOState();
}

class _MyToDOState extends State<MyToDO> {
  List<Map<String, dynamic>> tasks = []; // empty list for storing hive data
  final title = TextEditingController();
  final task = TextEditingController();

  //Hive class object
  final my_task_box = Hive.box("todo_box");

//hive create operation
  Future<void> createTask(Map<String, dynamic> newtask) async {
    await my_task_box.add(newtask);
    fetchTask();
  }

  //read all data from hive
  void fetchTask() {
    final task_from_hive = my_task_box.keys.map((key) {
      final value = my_task_box.get(key);
      return {"id": key, 'title': value['title'], 'task': value['task']};
    }).toList();

    setState(() {
      tasks = task_from_hive.reversed
          .toList(); // reversed to sort in items in latest to oldest order
    });
  }

//update task
  Future<void> updateTask(int itemkey, Map<String, String> uptask) async {
    await my_task_box.put(itemkey, uptask);
    fetchTask();
  }

  //delete task
  Future<void> deleteTask(int itemkey) async {
    await my_task_box.delete(itemkey);
    fetchTask();

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Successfully Deleted")));
  }

  void showTask(BuildContext context, int? itemkey) {
    if (itemkey != null) {
      final existing_task =
          tasks.firstWhere((element) => element['id'] == itemkey);
      title.text = existing_task['title'];
      task.text = existing_task['task'];
    }
    showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: title,
                  decoration: const InputDecoration(hintText: "Title"),
                ),
                TextField(
                  controller: task,
                  decoration: const InputDecoration(hintText: 'Task'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      if (itemkey == null) {
                        createTask({
                          'title': title.text.trim(),
                          'task': task.text.trim()
                        });
                      }
                      if (itemkey != null) {
                        updateTask(
                            itemkey, {'title': title.text, 'task': task.text});
                      }
                      title.text = " ";
                      task.text = " ";
                      Navigator.of(context).pop();
                    },
                    child:
                        Text(itemkey == null ? "Create Task" : "Update Task"))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
      ),
      body: tasks.isEmpty
          ? const Center(child: Text("NO TASK"))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (ctx, index) {
                final mytask = tasks[index];
                return Card(
                  child: ListTile(
                    title: Text(mytask["title"]),
                    subtitle: Text(mytask['task']),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            onPressed: () {
                              showTask(context, mytask['id']);
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              deleteTask(mytask['id']);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTask(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
