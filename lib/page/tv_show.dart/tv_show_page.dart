import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:happymovie/page/tv_show.dart/controller/tv_show_controller.dart';

import '../../widgets/custom_shimmer_box/custom_shimmer_box.dart';
import '../home_screen/controller/home_screen_controller.dart';
import '../home_screen/home_screen.dart';

class TVShowPage extends StatelessWidget {
  TVShowPage({Key? key}) : super(key: key);
  final homeController = Get.put(HomeScreenController());
  final tvshowController = Get.put(TVShowController());
  final carouselControllerImage = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: Stack(
        children: [
          ListView(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    carouselController: carouselControllerImage,
                    options: CarouselOptions(
                      initialPage: 0,
                      // aspectRatio: 16 / 9,
                      // autoPlayCurve: Curves.easeInToLinear,
                      autoPlayCurve: Curves.decelerate,
                      autoPlayAnimationDuration: const Duration(seconds: 4),
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      aspectRatio: 12,
                      height: 520,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                    ),
                    items: homeController.tvshowListCard
                        .map(
                          (e) => customSliderMovieImage(
                            rate: e.rate,
                            thumnailUrl: e.thumbnailUrl,
                            title: e.movieName,
                          ),
                        )
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 0, right: 0, bottom: 20),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Trending',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.trending_up_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 0,
                    right: 0,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          initialPage: 0,
                          aspectRatio: 16 / 9,
                          // autoPlayCurve: Curves.easeInToLinear,
                          autoPlayCurve: Curves.decelerate,
                          autoPlayAnimationDuration: const Duration(seconds: 4),
                          autoPlay: true,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          viewportFraction: 0.6,
                          height: 330,
                          autoPlayInterval: const Duration(seconds: 10),
                          onPageChanged: (i, v) {
                            carouselControllerImage.animateToPage(i);
                          }),
                      items: homeController.tvshowListCard
                          .map(
                            (e) => CustomMovieCardV2(
                              imgUrl: e.imageUrl,
                              hideFav: true,
                              rate: e.rate,
                              title: e.movieName,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'TV Shows',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'See More',
                      style: TextStyle(
                          color: Color(0xFFC6C6C6),
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 100, left: 20),
                child: SizedBox(
                  height: 200,
                  child: ListView(
                    // physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: homeController.tvshowListCard
                        .map((e) => CustomMovieCard(
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
        ],
      ),
    );
  }

  Widget customSliderMovieImage({
    String? thumnailUrl,
    String? title,
    double? rate,
  }) {
    return Stack(
      children: [
        Image.network(
          '$thumnailUrl',
          fit: BoxFit.cover,
          height: 330,
          width: double.infinity,
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    const Color(0xFF141414).withOpacity(0.5),
                    const Color(0xFF141414),
                  ],
                  stops: const [
                    0.0,
                    0.8
                  ])),
        ),
        Positioned(
          left: 20,
          top: 90,
          child: AutoSizeText(
            title!.toUpperCase(),
            maxFontSize: 25,
            minFontSize: 20,
            maxLines: 1,
            style: const TextStyle(
                color: Colors.white, fontSize: 0, fontWeight: FontWeight.bold),
          ),
        ),
        const Positioned(
          left: 20,
          top: 115,
          child: Text(
            'Season 11',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Positioned(
          top: 136,
          left: 20,
          child: RatingBar.builder(
            ignoreGestures: true,
            itemSize: 14,
            initialRating: rate! / 2.3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.only(),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
              size: 2,
            ),
            maxRating: 10,
            unratedColor: const Color(0xFF7D7D7D),
            onRatingUpdate: (rating) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150, left: 20),
          child: SizedBox(
            height: 20,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      const Text(
                        'Crime',
                        style:
                            TextStyle(color: Color(0xFF7D7D7D), fontSize: 14),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      if (index < 2)
                        Container(
                          height: 12,
                          width: 1,
                          color: const Color(0xFF405502),
                        ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  );
                }),
          ),
        )
      ],
    );
  }
}

class CustomMovieCardV2 extends StatelessWidget {
  const CustomMovieCardV2({
    Key? key,
    this.imgUrl,
    this.title = '',
    this.rate = 0.0,
    this.hideFav = true,
  }) : super(key: key);
  final String? imgUrl;
  final String? title;
  final double? rate;
  final bool? hideFav;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        width: 200,
        height: 320,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  '$imgUrl',
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return loadingProgress.expectedTotalBytes != null
                        ? ShimmerBox(
                            height: 150,
                            width: 200,
                            isColor: true,
                            color: Colors.red[100],
                            baseColor: Colors.grey[400],
                            highlightColor: Colors.white,
                            radius: 10,
                          )
                        : Container();
                  },
                  width: 200,
                  height: 280,
                ),
              ),
            ),
            // Positioned(
            //   top: 0,
            //   child: SizedBox(
            //     width: 200,
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(8),
            //       child: Image.network(
            //         '$imgUrl',
            //         fit: BoxFit.fill,
            //         loadingBuilder: (BuildContext context, Widget child,
            //             ImageChunkEvent? loadingProgress) {
            //           if (loadingProgress == null) return child;
            //           return loadingProgress.expectedTotalBytes != null
            //               ? ShimmerBox(
            //                   height: 150,
            //                   width: 200,
            //                   isColor: true,
            //                   color: Colors.red[100],
            //                   baseColor: Colors.grey[400],
            //                   highlightColor: Colors.white,
            //                   radius: 10,
            //                 )
            //               : Container();
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            hideFav! != true
                ? Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 15,
                      ),
                    ))
                : Container(),
            Positioned(
              bottom: 20,
              left: 0,
              child: SizedBox(
                width: 200,
                height: 22,
                child: AutoSizeText(
                  title ?? '',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  minFontSize: 10,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                          ignoreGestures: true,
                          itemSize: 16,
                          initialRating: rate! / 2.3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.only(),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 2,
                          ),
                          maxRating: 10,
                          unratedColor: const Color(0xFF7D7D7D),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '$rate',
                          style: const TextStyle(
                              color: Colors.amber, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'SS 1',
                      style: TextStyle(color: Color(0xFF7D7D7D), fontSize: 14),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'EPS 16',
                      style: TextStyle(color: Color(0xFF7D7D7D), fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
