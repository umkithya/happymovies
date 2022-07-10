import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../../home_screen/model/popular_movie_model/popular_movies_model/movies_model.dart';

class TVShowController extends GetxController {
  final activeIndex = 0.obs;
  final carouselControllerCard = CarouselController ().obs;
  final carouselControllerImage = CarouselController ().obs;
   var tvshowListCard = <MoviesModel>[
    const MoviesModel(
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BZmU5NTcwNjktODIwMi00ZmZkLTk4ZWUtYzVjZWQ5ZTZjN2RlXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_UY1200_CR83,0,630,1200_AL_.jpg',
        rate: 8.2,
        thumbnailUrl:
            'https://lowelaw.com/wp-content/uploads/2021/10/The-Walking-Dead.jpg',
        movieName: 'The Walking Dead'),
    const MoviesModel(
        imageUrl: 'https://i.mydramalist.com/X6vkX_4f.jpg',
        thumbnailUrl: 'https://img.phonandroid.com/2021/10/Squid-Game-2.jpg',
        rate: 8.0,
        movieName: 'Squid Game'),
    const MoviesModel(
        imageUrl:
            'https://dnm.nflximg.net/api/v6/2DuQlx0fM4wd1nzqm5BFBi6ILa8/AAAAQbqiOAwdYv-BxYmsb3M3KhbVIwua4rAqtfGEvgtXDq1J2S-DM6-TBmZOC1RcZWisKNYpEX1V7MWNo5HXPmb7D9N3CcIbIepDtnmD2nnjjPnh-yJV4ymbv8z0vOsrdLra3ljvFmvne11oDrQg9GnPATyt.jpg?r=52d',
        rate: 8.8,
        thumbnailUrl:
            'https://m.media-amazon.com/images/M/MV5BMThlOWE3MWEtZjM4Ny00M2FiLTkyMmYtZGY3ZTcyMzM5YmNlXkEyXkFqcGdeQWpnYW1i._V1_.jpg',
        movieName: 'Peaky Blinders'),
    const MoviesModel(
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BOTAxOTlmOTAtMjA0Yy00YjVjLWE3OTQtYjAzMWMxOTAwZTY1XkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_FMjpg_UX1000_.jpg',
        rate: 7.2,
        thumbnailUrl:
            'https://www.bosshunting.com.au/wp-content/uploads/2021/09/Obi-Wan-Kenobi-Series-Release-Date-Leak.jpg',
        movieName: 'Obi-Wan Kenobi'),
    const MoviesModel(
        imageUrl:
            'https://resizing.flixster.com/RDlGcNaA0dIfEJku6xO2jvlnZu8=/ems.cHJkLWVtcy1hc3NldHMvdHZzZWFzb24vNDZlNzMzZDUtZmQ4My00N2E5LWEwNzgtZTg3ZmZlNzMyMGJiLmpwZw==',
        rate: 5.1,
        thumbnailUrl:
            'https://cdn.mos.cms.futurecdn.net/Q6viomQW78LMdArpydpYkU.jpg',
        movieName: 'Money Heist: Korea'),
    const MoviesModel(
        imageUrl:
            'https://www.crew-united.com/Media/Images/759/759739/759739.entity.jpg',
        thumbnailUrl:
            'https://media.pitchfork.com/photos/620e81cad8bc62857b465cc3/2:1/w_2560%2Cc_limit/Stranger-Things-Season-4.jpg',
        rate: 8.6,
        movieName: 'Stranger Things'),
  ];
}
