import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udecproject/statemanagement/provider/movie_provider.dart';

import 'WishList.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
    create: (BuildContext context) => MovieProvider(),
    child: MaterialApp(home: MyApp1()),
  ));
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var mylist = context.watch<MovieProvider>().mylist;

    return Scaffold(
      appBar: AppBar(
        title:  Text("MOVIES",style: Theme.of(context).textTheme. headlineLarge,),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WishList()));
                  },
                  icon: const Icon(Icons.favorite),
                  label: Text(
                    "Wishlist ${mylist.length}",
                    style: TextStyle(fontSize: 30),
                  )),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final currentMovie = movies[index];
                        return Card(
                          key: ValueKey(currentMovie.title),
                          color: Colors.yellow,
                          elevation: 5,
                          child: ListTile(
                            title: Text(currentMovie.title),
                            subtitle: Text(currentMovie.time ?? 'No time'),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: mylist.contains(currentMovie)
                                    ? Colors.red
                                    : Colors.white,
                              ),
                              onPressed: () {
                                if (!mylist.contains(currentMovie)) {
                                  context
                                      .read<MovieProvider>()
                                      .addToList(currentMovie);
                                } else {
                                  context
                                      .read<MovieProvider>()
                                      .removeFromList(currentMovie);
                                }
                              },
                            ),
                          ),
                        );
                      }),
                ),
              )),
            ],
          )),
    );
  }
}
