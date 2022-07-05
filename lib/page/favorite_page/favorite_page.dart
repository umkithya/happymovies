import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_screen/controller/home_screen_controller.dart';
import '../home_screen/home_screen.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeController = Get.put(HomeScreenController());

    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Favorite movies',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.trash,
                      color: Color(0xFFDAA520),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 13, bottom: 0, left: 15, right: 0),
              child: SizedBox(
                height: 200,
                child: ListView(
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: _homeController.popularMovieHomeList
                      .map((e) => CustomMovieCard(
                            hideFav: false,
                            imgUrl: e.imageUrl,
                            rate: e.rate,
                            title: e.movieName,
                          ))
                      .toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Favorite shows',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.trash,
                      color: Color(0xFFDAA520),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 13, bottom: 50, left: 15, right: 0),
              child: SizedBox(
                height: 200,
                child: ListView(
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: _homeController.popularMovieHomeList
                      .map((e) => CustomMovieCard(
                            hideFav: false,
                            imgUrl: e.imageUrl,
                            rate: e.rate,
                            title: e.movieName,
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
