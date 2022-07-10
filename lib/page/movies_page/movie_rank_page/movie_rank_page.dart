import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/appbar/custom_app_bar.dart';
import '../../home_screen/controller/home_screen_controller.dart';
import '../../home_screen/home_screen.dart';

class MoviesRankPage extends StatelessWidget {
  MoviesRankPage({Key? key}) : super(key: key);
  final homeController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B),
      appBar: customAppBar(
          title: 'Ranking Movies',
          backgroundColor: const Color(0xFF141414),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFFDAA520),
          )),
      body: GridView(
        // cacheExtent: 10,

        padding: const EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
        // padding: const EdgeInsets.only(left: 20, right: 0, top: 20, bottom: 30),
        // shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.78,
          mainAxisSpacing: 30,
          mainAxisExtent: 280,
        ),
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   // crossAxisCount: 3,
        //   // // childAspectRatio: 0.5,
        //   // crossAxisSpacing: 0.0,
        //   // childAspectRatio: 117 / 200,
        //   // mainAxisSpacing: 10.0,
        // ),
        children: homeController.languageMovieHomeList
            .map((e) => SizedBox(
                  height: 280,
                  child: CustomMovieCard(
                    imgUrl: e.imageUrl,
                    rate: e.rate,
                    title: e.movieName,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
