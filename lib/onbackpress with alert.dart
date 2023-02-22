import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BackPress_with_Alert(),
  ));
}

class BackPress_with_Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> showAlert() async {
      return await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Confirm Exit???"),
              content: const Text("Do you really want to exit"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text("Yes")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text("No")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text("Cancel"))
              ],
            );
          });
    }

    return WillPopScope(
        onWillPop: showAlert,
        child: const Scaffold(
          body: Center(
            child: Text("Press Back Button to Exit!!!!!"),
          ),
        ));
  }
}
