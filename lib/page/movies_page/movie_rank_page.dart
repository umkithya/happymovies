import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happymovie/page/home_screen/model/popular_movie_model/popular_movies_model/movies_model.dart';
import 'package:happymovie/page/movies_page/controller/movies_controller.dart';

import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/custom_shimmer_box/custom_shimmer_box.dart';

class MoviesRankPage extends StatelessWidget {
  const MoviesRankPage({Key? key}) : super(key: key);
  // final movieController = Get.put(MoviesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF171C20),
      appBar: customAppBar(
          title: 'Ranking Movies',
          backgroundColor: const Color(0xFF171C20),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFFDAA520),
          )),
      body: GetBuilder<MoviesController>(
        init: MoviesController(),
        builder: (movieController) => Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              itemCount: movieController.languageMovieHomeList.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                mainAxisExtent: 350,
                //  childAspectRatio: 0.75,
                crossAxisSpacing: 30,
              ),
              itemBuilder: (context, index) {
                return CustomMovieCard(
                  moviesModel: movieController.languageMovieHomeList[index],
                  ontapFav: () {
                    movieController.isFav.value = !movieController.isFav.value;
                    debugPrint(
                        '${movieController.languageMovieHomeList[index].copyWith(isFavourite: movieController.isFav.value).isFavourite}');
                    movieController.update();
                  },
                  imgUrl: movieController.languageMovieHomeList[index].imageUrl,
                  rate: movieController.languageMovieHomeList[index].rate,
                  title: movieController.languageMovieHomeList[index].movieName,
                  isFav:
                      movieController.languageMovieHomeList[index].isFavourite,
                  currentIndex: index,
                  onTapIndex: movieController.currentIndex.value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMovieCard extends StatelessWidget {
  const CustomMovieCard({
    Key? key,
    this.imgUrl,
    this.title = '',
    this.rate = 0.0,
    this.hideFav = true,
    required this.ontapFav,
    this.isFav,
    this.currentIndex = 100,
    this.onTapIndex = 100,
    required this.moviesModel,
  }) : super(key: key);
  final String? imgUrl;
  final String? title;
  final double? rate;
  final bool? hideFav;
  final bool? isFav;
  final int? currentIndex;
  final int? onTapIndex;
  final GestureTapCallback ontapFav;
  final MoviesModel moviesModel;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: '$imgUrl',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
              memCacheHeight:
                  (200 * MediaQuery.of(context).devicePixelRatio).round(),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  ShimmerBox(
                height: 150,
                isColor: true,
                color: Colors.red[100],
                baseColor: Colors.grey[400],
                highlightColor: Colors.white,
                radius: 10,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),

          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.02),
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: const [
                      0.8,
                      1
                    ])),
          ),
          Positioned(
            left: -40,
            top: -40,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: const Color(0xFFFFD000),
                borderRadius: BorderRadius.circular(90),
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 10,
            child: Column(
              children: [
                Text(
                  rate.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
          // const
          hideFav! != false
              ? Positioned(
                  right: 10,
                  top: 8,
                  child: GestureDetector(
                    onTap: ontapFav,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey[200]!.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Icon(
                        isFav! ? Icons.favorite : Icons.favorite_border,
                        color: isFav! ? Colors.red : Colors.white,
                        // Icons.favorite,

                        // color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ))
              : Container(),
          // Positioned(
          //     bottom: 20,
          //     child: SizedBox(
          //       width: 150,
          //       height: 22,
          //       child: AutoSizeText(
          //         title ?? '',
          //         style: const TextStyle(
          //             fontSize: 16,
          //             fontWeight: FontWeight.w700,
          //             color: Colors.white),
          //         minFontSize: 14,
          //         maxLines: 1,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     )),
          // Positioned(
          //   bottom: 0,
          //   child: SizedBox(
          //     width: 150,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         RatingBar.builder(
          //           ignoreGestures: true,
          //           itemSize: 16,
          //           initialRating: rate! / 2.3,
          //           minRating: 1,
          //           direction: Axis.horizontal,
          //           allowHalfRating: true,
          //           itemCount: 5,
          //           itemPadding: const EdgeInsets.only(),
          //           itemBuilder: (context, _) => const Icon(
          //             Icons.star,
          //             color: Colors.amber,
          //             size: 2,
          //           ),
          //           maxRating: 10,
          //           unratedColor: const Color(0xFF7D7D7D),
          //           onRatingUpdate: (rating) {
          //             print(rating);
          //           },
          //         ),
          //         Text(
          //           '$rate',
          //           style: const TextStyle(
          //               color: Colors.amber,
          //               fontSize: 14,
          //               fontWeight: FontWeight.w500),
          //         )
          //       ],
          //     ),
          //   ),
          // )
          Positioned(
            bottom: 12,
            left: 8,
            right: 0,
            child: AutoSizeText(
              title ?? '',
              style: const TextStyle(
                  fontWeight: FontWeight.w800, color: Colors.white),
              minFontSize: 18,
              maxLines: 1,
              // textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
