import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/custom_shimmer_box/custom_shimmer_box.dart';
import '../../home_screen/controller/home_screen_controller.dart';

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
        padding: const EdgeInsets.only(left: 20, right: 0, top: 20, bottom: 30),
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   // crossAxisCount: 3,
        //   // // childAspectRatio: 0.5,
        //   // crossAxisSpacing: 0.0,
        //   // childAspectRatio: 117 / 200,
        //   // mainAxisSpacing: 10.0,
        // ),
        children: homeController.languageMovieHomeList
            .map((e) => SizedBox(
                  height: 200,
                  child: CustomMovieCard(
                    onTap: () {
                      debugPrint('Click');

                      // context.router.push(VideoDetailRoute());
                      // context.router.pushNativeRoute(VideoDetailRoute());
                    },
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

class CustomMovieCard extends StatelessWidget {
  const CustomMovieCard({
    Key? key,
    this.imgUrl,
    this.title = '',
    this.rate = 0.0,
    this.onTap,
  }) : super(key: key);
  final String? imgUrl;
  final String? title;
  final double? rate;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: 200,
        child: Stack(
          children: [
            GestureDetector(
              onTap: onTap,
              child: SizedBox(
                height: 180,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: '$imgUrl',
                    fit: BoxFit.cover,
                    maxHeightDiskCache: 250,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => const ShimmerBox(
                            // height: 150,
                            ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 18,
                child: SizedBox(
                  width: 100,
                  height: 22,
                  child: AutoSizeText(
                    title ?? '',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    minFontSize: 10,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            Positioned(
              bottom: 4,
              left: 0,
              right: 2,
              child: SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar.builder(
                      ignoreGestures: true,
                      itemSize: 13,
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
                      unratedColor: const Color(0xFF555555),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Text(
                      '$rate',
                      style: const TextStyle(color: Colors.amber, fontSize: 12),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
