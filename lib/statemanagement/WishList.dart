import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udecproject/statemanagement/provider/movie_provider.dart';

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mylist = context.watch<MovieProvider>().mylist;

    return Scaffold(
      appBar: AppBar(
        title: Text("My WishList ${mylist.length}"),
      ),
      body: ListView.builder(
          itemCount: mylist.length,
          itemBuilder: (ctx, index) {
            final currentmovie = mylist[index];
            return Card(
              key: ValueKey(currentmovie.title),
              child: ListTile(
                title: Text(currentmovie.title),
                subtitle: Text(currentmovie.time ?? 'No Time'),
                trailing: TextButton(
                  onPressed: () {
                    context.read<MovieProvider>().removeFromList(currentmovie);
                  },
                  child: Text("Remove"),
                ),
              ),
            );
          }),
    );
  }
}
