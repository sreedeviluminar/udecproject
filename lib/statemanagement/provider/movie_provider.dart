import 'dart:math';
import 'package:flutter/cupertino.dart';
import '../model/Movie.dart';

final List<Movie> movieList = List.generate(
    50,
        (index) =>
        Movie(
            title: "Movie $index",
            time: "${Random().nextInt(100) + 60} minutes"));

class MovieProvider with ChangeNotifier {

  final List<Movie> _movies = movieList;
  List<Movie> get movies => _movies; // get all the movies to the home page

  final List<Movie> _myList = [];
  List<Movie> get mylist => _myList; // get the wish listed movies

 void addToList(Movie movie){ // adding movie to the wishlist
    _myList.add(movie);
    notifyListeners();
 }

  void removeFromList(Movie movie){ // removing movie to the wishlist
    _myList.remove(movie);
    notifyListeners();
  }
}
