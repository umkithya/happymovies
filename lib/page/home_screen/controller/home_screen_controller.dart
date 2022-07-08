import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happymovie/helper/api_base_helper.dart';
import 'package:happymovie/page/home_screen/model/category_model/category_model.dart';
import 'package:happymovie/page/home_screen/model/language_model/language_model.dart';

import 'package:happymovie/page/home_screen/model/popular_movie_model/popular_movies_model/movies_model.dart';

class HomeScreenController extends GetxController {
  final activeIndex = 0.obs;
  var homeImageSliderList = [
    "https://cdn.theplaylist.net/wp-content/uploads/2022/05/14164920/Avatar-2-The-Way-Of-Water-750x400.jpg",
    "https://cdn.theplaylist.net/wp-content/uploads/2022/05/23222503/thor-love-and-thunder-poster-crop-750x400.jpg",
    "https://media.distractify.com/brand-img/Cx4Rk9-FP/0x0/gothamknightscw-1654121916394.jpg",
    "https://static1.colliderimages.com/wordpress/wp-content/uploads/2021/08/black-adam-everything-we-know-so-far.jpg?q=50&fit=contain&w=943&h=472&dpr=1.5",
    "https://images.thedirect.com/media/article_full/CM2.jpg",
    "https://ntvb.tmsimg.com/assets/p18935685_v_h8_aa.jpg?w=1280&h=720",
  ];
  var categoryList = <CategoryModel>[
    CategoryModel(
      cid: 3,
      title: 'Action',
      imgUrl:
          'https://cdn.flickeringmyth.com/wp-content/uploads/2021/11/action-21st-century.jpg',
      color: Colors.yellow,
    ),
    CategoryModel(
      cid: 5,
      title: 'Drama',
      imgUrl:
          'https://pic5.iqiyipic.com/image/20211022/9e/34/a_100474276_m_601_en_480_270.jpg',
      color: Colors.pink,
    ),
    CategoryModel(
      cid: 4,
      title: 'War',
      imgUrl:
          'https://www.wearethemighty.com/uploads/legacy/assets.rbl.ms/17301727/origin.jpg',
      color: Colors.orange,
    ),
    CategoryModel(
      cid: 1,
      title: 'Horror',
      imgUrl:
          'https://cdn.mos.cms.futurecdn.net/jBgAf4hT86w3W6daNwbrCG-1200-80.jpg',
      color: Colors.blue,
    ),
    CategoryModel(
        cid: 6,
        title: 'Adventure',
        imgUrl:
            'https://theactionelite.com/wp-content/uploads/2018/01/Pirates-Caribbean-5-Movie-Review-Dead-Men-Tell.jpg',
        color: const Color(0xFF213716)),
    CategoryModel(
      cid: 2,
      title: 'History',
      imgUrl:
          'https://media.newyorker.com/photos/590973d01c7a8e33fb38f206/master/pass/Lepore-Nat-Turner-film-Sundance.jpg',
      color: Colors.black.withOpacity(0.8),
    ),
    CategoryModel(
      cid: 7,
      title: 'Fantacy',
      imgUrl:
          'https://heavy.com/wp-content/uploads/2019/04/king-kong.jpg?quality=65&strip=all&w=780',
      color: Colors.deepPurple.withOpacity(0.8),
    ),
  ];
  var languageList = <LanguageModel>[
    LanguageModel(lid: 1, title: 'Khmer', color: Colors.blue),
    LanguageModel(lid: 2, title: 'Thailand', color: Colors.red),
    LanguageModel(lid: 3, title: 'Korea', color: Colors.yellow[800]),
    LanguageModel(lid: 4, title: 'Japan', color: Colors.deepPurple),
    LanguageModel(lid: 6, title: 'USA', color: Colors.pink),
    LanguageModel(lid: 6, title: 'Hong Kong', color: Colors.green),
  ];
  var episodeList = <LanguageModel>[
    LanguageModel(lid: 1, title: 'Episode-1', color: Colors.blue),
    LanguageModel(lid: 2, title: 'Episode-2', color: Colors.red),
    LanguageModel(lid: 3, title: 'Episode-3', color: Colors.yellow[800]),
    LanguageModel(lid: 4, title: 'Episode-4', color: Colors.deepPurple),
    LanguageModel(lid: 6, title: 'Episode-5', color: Colors.pink),
    LanguageModel(lid: 6, title: 'Episode-6', color: Colors.green),
  ];
  var languageMovieHomeList = <MoviesModel>[
    const MoviesModel(
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BMTgzOTQ1NDUwOF5BMl5BanBnXkFtZTgwNjAwNTkwMzI@._V1_.jpg',
        rate: 7.2,
        movieName: 'First They Killed My Father'),
    const MoviesModel(
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BYmZjNmExZTEtZWU2My00ZGRjLTg2YzMtYmZjYWE0NTNlZTVjL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTE3NTY3NzE@._V1_.jpg',
        rate: 5.4,
        movieName: 'Jailbreak'),
    const MoviesModel(
        imageUrl:
            'https://4.bp.blogspot.com/-Xshnrlg8kTg/WU76vYimHvI/AAAAAAAAF7o/RpdSYol7QAAOJSd1ia6kALG6pogP45O0ACLcBGAs/s1600/Sbek%2BKong%2BKhmer%2BMoive-RithNagaMoviesKH.jpg',
        rate: 8.6,
        movieName: 'Sbeak Kong'),
    const MoviesModel(
        imageUrl:
            'https://pics.filmaffinity.com/The_Lost_City-223738504-mmed.jpg',
        rate: 6.2,
        movieName: 'The Lost City'),
    const MoviesModel(
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BOTZjYWJmMTItZTA0NC00MTc4LWJlZGEtZWNlN2RiMzc3NTM1XkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg',
        rate: 5.1,
        movieName: 'Morbius'),
    const MoviesModel(
        imageUrl:
            'https://pbs.twimg.com/media/FJ5jI3YXMAMPxxI?format=jpg&name=900x900',
        rate: 6.4,
        movieName: 'Uncharted'),
  ];
  var popularMovieHomeList = <MoviesModel>[
    const MoviesModel(
        imageUrl:
            'https://assets.mycast.io/posters/the-batman-2022-fan-casting-poster-92097-large.jpg?1616983790',
        rate: 7.9,
        movieName: 'The Batman'),
    const MoviesModel(
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/3/3e/Sonic_the_Hedgehog_2_film_poster.jpg',
        rate: 6.6,
        movieName: 'Sonic the Hedgehog 2'),
    const MoviesModel(
        imageUrl:
            'https://www.dkteplice.cz/wp-content/uploads/2022/05/Top-Gun-Maverick.jpg',
        rate: 8.6,
        movieName: 'Top Gun: Maverick'),
    const MoviesModel(
        imageUrl:
            'https://pics.filmaffinity.com/The_Lost_City-223738504-mmed.jpg',
        rate: 6.2,
        movieName: 'The Lost City'),
    const MoviesModel(
        imageUrl:
            'https://m.media-amazon.com/images/M/MV5BOTZjYWJmMTItZTA0NC00MTc4LWJlZGEtZWNlN2RiMzc3NTM1XkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg',
        rate: 5.1,
        movieName: 'Morbius'),
    const MoviesModel(
        imageUrl:
            'https://pbs.twimg.com/media/FJ5jI3YXMAMPxxI?format=jpg&name=900x900',
        rate: 6.4,
        movieName: 'Uncharted'),
  ];
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
  var popularList = <MoviesModel>[];
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  fetchPopularMovie() async {
    await _apiBaseHelper
        .onNetworkRequesting(
            url: 'popular-movies/',
            methode: METHODE.post,
            body: {"rate": 7, "start": "2019", "end": "2022"},
            isAuthorize: false)
        .then((value) {
      // value['result'].map)(e){

      // });
      popularList.clear();
      value['result'].map((value) {
        popularList.add(MoviesModel.fromJson(value));
      }).toList();
      for (var element in popularList) {
        debugPrint('$element');
      }
    });
  }

  var popularMovieLists = <MoviesModel>[];
  Stream<List<MoviesModel>> readMovie() => FirebaseFirestore.instance
      .collection('movie')
      .snapshots()
      .map((event) => event.docs.map((e) {
            return MoviesModel.fromJson(e.data());
          }).toList());
  Future addMovieDetail() async {
    final docMovie = FirebaseFirestore.instance.collection('movie').doc('2');
    final json = {
      'categories': ["", ""],
      'enurl_srt': "no",
      'image_url':
          "https://m.media-amazon.com/images/M/MV5BNWM0ZGJlMzMtZmYwMi00NzI3LTgzMzMtNjMzNjliNDRmZmFlXkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_.jpg",
      'khurl_srt': "no",
      'm3u8url_server1':
          "https://e-6.mzzcloud.life/_v8/3582b4da9312f4e71eda6f68b63b7b9d9076fa33db4aee2a4d17ce910d62725772a5943a21406df8d119618f15b326cc9e2c8ef2e043f52cef8338902d71d82b06afac638f66d5e277fe04931afd9c93aee6c03ea9a72eaf889e6d0c9c5db034d68ba9fc995313f42ff0973d0f9795029e0cbc039c88fc29478f77a005de3174/720/index.m3u8",
      'm3u8url_server2':
          "https://e-5.mzzcloud.life/_v8/9464cde7ca464582ab025882cf15066ecbc18db0d5224028c548fa747319ab4d62652388c99308aea4fa4cf6f9862303a9d96a1164e251b224c193a912bdb21a4be9a9b7c89bdde94523e061637d5fd4976492f81bf5636946dc74c3c74214ac4c13bf40205ce12f1c85e6729cd8cc39c6c5c3c4cd4fa5ec002e70f9bddf66d2/1080/index.m3u8",
      'm3u8url_server3':
          "https://b-g-eu-2.feetcdn.com:2223/v2-hls-playback/9464cde7ca464582ab025882cf15066ecbc18db0d5224028c548fa747319ab4d62652388c99308aea4fa4cf6f9862303014be5a6d9c7a22dc49cf21709d1597c8849ae48bf0fd505caca078d0a51adedb555d727c92e8f327058fe47996b7a20a985ccdbb86d51c48f02cb73f1b743d001a0eb50e1245b738ed37d3a2c807e6afbc204a71a0bf59ae7603984fae186eab8a9724af0ff555a62c1470fecb1f0aee154dcf07bbefc51712337c2921c8289/1080/index.m3u8",
      'movieName': "Doctor Strange in the Multiverse of Madness",
      'overview':
          "When Doctor Strange meets America Chavez, a girl who is being hunted for her unique ability to travel through the multiverse, he steps in to help America survive.",
      'quality': "HD",
      'rate': "7.3",
      'release_date': "2022-05-04",
      'thumbnail_url':
          "https://cdn.mos.cms.futurecdn.net/NJXQ8h3mUd9mhsh2m8xpba.jpg",
    };
    await docMovie.set(json).then((value) {
      debugPrint('Added Success');
    }).onError((error, stackTrace) {
      debugPrint('error:$error');
    });
  }
}
