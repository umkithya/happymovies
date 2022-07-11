import 'package:get/get.dart';

import '../../home_screen/model/popular_movie_model/popular_movies_model/movies_model.dart';

class MoviesController extends GetxController {
  final appBarTitle = ''.obs;
  final isFav = false.obs;
  final currentIndex = 100.obs;
  final stringName = ''.obs;
  final model = const MoviesModel().obs;
  var languageMovieHomeList = <MoviesModel>[
    const MoviesModel(
      imageUrl:
          'https://m.media-amazon.com/images/M/MV5BMTgzOTQ1NDUwOF5BMl5BanBnXkFtZTgwNjAwNTkwMzI@._V1_.jpg',
      rate: 7.2,
      movieName: 'First They Killed My Father',
      isFavourite: false,
    ),
    const MoviesModel(
      imageUrl:
          'https://m.media-amazon.com/images/M/MV5BYmZjNmExZTEtZWU2My00ZGRjLTg2YzMtYmZjYWE0NTNlZTVjL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTE3NTY3NzE@._V1_.jpg',
      rate: 5.4,
      movieName: 'Jailbreak',
      isFavourite: true,
    ),
    const MoviesModel(
      imageUrl:
          'https://4.bp.blogspot.com/-Xshnrlg8kTg/WU76vYimHvI/AAAAAAAAF7o/RpdSYol7QAAOJSd1ia6kALG6pogP45O0ACLcBGAs/s1600/Sbek%2BKong%2BKhmer%2BMoive-RithNagaMoviesKH.jpg',
      rate: 8.6,
      movieName: 'Sbeak Kong',
      // isFavourite: false,
    ),
    const MoviesModel(
      imageUrl:
          'https://pics.filmaffinity.com/The_Lost_City-223738504-mmed.jpg',
      rate: 6.2,
      movieName: 'The Lost City',
      // isFavourite: false,
    ),
    const MoviesModel(
      imageUrl:
          'https://m.media-amazon.com/images/M/MV5BOTZjYWJmMTItZTA0NC00MTc4LWJlZGEtZWNlN2RiMzc3NTM1XkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg',
      rate: 5.1,
      movieName: 'Morbius',
      // isFavourite: false,
    ),
    const MoviesModel(
      imageUrl:
          'https://pbs.twimg.com/media/FJ5jI3YXMAMPxxI?format=jpg&name=900x900',
      rate: 6.4,
      movieName: 'Uncharted',
      // isFavourite: false,
    ),
  ];
}
