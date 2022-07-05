import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:happymovie/page/home_screen/controller/home_screen_controller.dart';
import 'package:happymovie/page/home_screen/model/popular_movie_model/popular_movies_model/movies_model.dart';
import 'package:happymovie/page/movies_page/controller/movies_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../config/route/app_route.gr.dart';
import '../../widgets/custom_shimmer_box/custom_shimmer_box.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.put(HomeScreenController());
  final moviesController = Get.put(MoviesController());
  final controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    // _homeController.fetchPopularMovie();
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xFF141414),
        // backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              // physics: const NeverScrollableScrollPhysics(),
              controller: ScrollController(),
              children: [
                //popular title:

                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 0, right: 0),
                  child: Stack(
                    children: [
                      Image.network(
                        'https://poetryschool.com/assets/uploads/2014/12/PosterCollage.jpg',
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.4),
                                  const Color(0xFF141414),
                                ],
                                stops: const [
                                  0.0,
                                  1.0
                                ])),
                      ),
                      GestureDetector(
                        onTap: () {
                          homeController.addMovieDetail();
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            'Upcoming',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 0,
                        right: 0,
                        child: CarouselSlider(
                            carouselController: controller,
                            items: homeController.homeImageSliderList
                                .map((e) => Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          e,
                                          fit: BoxFit.fill,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? ShimmerBox(
                                                    height: 120,
                                                    width: 380,
                                                    isColor: true,
                                                    color: Colors.red[100],
                                                    baseColor: Colors.grey[400],
                                                    highlightColor:
                                                        Colors.white,
                                                    radius: 10,
                                                  )
                                                : Container();
                                          },
                                          width: 350,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            options: CarouselOptions(
                              onPageChanged:
                                  (index, carouselPageChangedReason) {
                                homeController.activeIndex.value = index;
                              },
                              height: 120,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              initialPage: 0,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              // aspectRatio: 16 / 9,
                              viewportFraction: 1,
                              autoPlay: true,
                            )),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 20,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedSmoothIndicator(
                            count: 6,
                            curve: Curves.easeInOutBack,

                            effect: const ScrollingDotsEffect(
                                spacing: 5,
                                radius: 0,
                                dotWidth: 15,
                                dotHeight: 3.5,
                                //paintStyle: PaintingStyle.stroke,
                                strokeWidth: 1.5,
                                dotColor: Color(0xFF555555),
                                activeDotColor: Color(0xFFDAA520)),
                            // your preferred effect
                            onDotClicked: (index) {
                              //controller.animateToPage(index);
                            },
                            activeIndex: homeController.activeIndex.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //category card
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 10, right: 0),
                  child: SizedBox(
                    height: 50,
                    child: ListView(
                      controller: ScrollController(),
                      // physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: homeController.categoryList
                          .map((e) => customCategoryCard(
                                imgUrl: e.imgUrl,
                                color: e.color,
                                onTap: () {
                                  moviesController.appBarTitle.value = e.title!;
                                  context.router.push(const MoviesPageRoute());
                                },
                                text: e.title,
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                //ads banner
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 5, right: 5),
                  child: SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: Image.network(
                        'https://static.semrush.com/blog/uploads/media/b6/02/b602c34e9b6809d22b00dfa142c9dfc4/7jLg9zyEKiXwwW5K8BgLDrO7UdI24Sr1wlOZ9fu_AEbl7B2NM9jiEuSyPAAaokLR4AUBMmAn43WOm4-N4peDkFVBQDdNl_xrArlAa3Mx6guZTOmppZpCTXIv56BRWceDkrCndwYp%3Ds0.png',
                        fit: BoxFit.cover, loadingBuilder:
                            (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return loadingProgress.expectedTotalBytes != null
                          ? ShimmerBox(
                              height: 55,
                              isColor: true,
                              color: Colors.red[100],
                              baseColor: Colors.grey[400],
                              highlightColor: Colors.white,
                              radius: 10,
                            )
                          : Container();
                    }),
                  ),
                ),
                //popular title:
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        onTap: () {
                          moviesController.appBarTitle.value = 'Popular Movies';
                          context.router.push(const MoviesPageRoute());
                        },
                        child: const Text(
                          'See More',
                          style: TextStyle(
                              color: Color(0xFFC6C6C6),
                              fontSize: 10,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                //popular movie card show
                Padding(
                  padding: const EdgeInsets.only(
                      top: 13, bottom: 0, left: 15, right: 0),
                  child: SizedBox(
                    height: 200,
                    child: StreamBuilder<List<MoviesModel>>(
                        stream: homeController.readMovie(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text(
                                'Something went wrong! ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final movies = snapshot.data;
                            return ListView(
                              // physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: movies!
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          context.router.push(
                                              VideoDetailRoute(moviesModel: e));
                                        },
                                        child: CustomMovieCard(
                                          imgUrl: e.imageUrl,
                                          rate: e.rate,
                                          title: e.movieName,
                                        ),
                                      ))
                                  .toList(),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                ),
                //Tv show label
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
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
                //tvshow movie card show
                Padding(
                  padding: const EdgeInsets.only(
                      top: 13, bottom: 10, left: 20, right: 0),
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

                //language card
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 15, bottom: 10, right: 0),
                  child: SizedBox(
                    height: 30,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: homeController.languageList
                          .map((e) => customCategoryCard(
                              isUnHideImage: false,
                              height: 30,
                              color: e.color,
                              onTap: () {},
                              text: e.title,
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)))
                          .toList(),
                    ),
                  ),
                ),
                //Khmer label
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Khmer',
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
                  padding:
                      const EdgeInsets.only(top: 20, bottom: 100, left: 20),
                  child: SizedBox(
                    height: 200,
                    child: ListView(
                      // physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: homeController.languageMovieHomeList
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
            //search section
            Container(
              color: const Color(0xFF141414),
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 20, right: 20, bottom: 10),
                child: SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        hintStyle:
                            TextStyle(color: Colors.grey[800], fontSize: 12),
                        hintText: "Search your movie...",
                        contentPadding: const EdgeInsets.only(top: 0, left: 10),
                        fillColor: Colors.white70),
                  ),
                ),
              ),
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
        width: 100,
        child: Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 150,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      '$imgUrl',
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return loadingProgress.expectedTotalBytes != null
                            ? ShimmerBox(
                                height: 150,
                                width: 100,
                                isColor: true,
                                color: Colors.red[100],
                                baseColor: Colors.grey[400],
                                highlightColor: Colors.white,
                                radius: 10,
                              )
                            : Container();
                      },
                    ),
                  ),
                ),
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
                    : Container()
              ],
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
              child: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar.builder(
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

Widget buildMovie(MoviesModel e, BuildContext context) => GestureDetector(
      onTap: () {
        // context.router.pushNamed('detail');
        // context.router
        //     .push(VideoDetailRoute(moviesModel: e));
        // context.router.pushAll([
        //   const VideoDetailRouter(),
        //   VideoDetailRoute(moviesModel: e),
        // ]);
        context.router.push(VideoDetailRoute(moviesModel: e));
      },
      child: CustomMovieCard(
        imgUrl: e.imageUrl,
        rate: e.rate,
        title: e.movieName,
      ),
    );

Widget customCategoryCard(
    {Function()? onTap,
    String? text,
    String? imgUrl,
    Color? color,
    double? width = 100,
    double? height = 50,
    bool? isUnHideImage = true,
    TextStyle? textStyle}) {
  return Padding(
    padding: const EdgeInsets.only(left: 0, right: 15),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Visibility(
              visible: isUnHideImage!,
              child: Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.network('$imgUrl',
                    fit: BoxFit.fill,
                    color: color,
                    colorBlendMode: BlendMode.color, loadingBuilder:
                        (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return loadingProgress.expectedTotalBytes != null
                      ? ShimmerBox(
                          height: width,
                          width: height,
                          isColor: true,
                          color: Colors.red[100],
                          baseColor: Colors.grey[400],
                          highlightColor: Colors.white,
                          radius: 10,
                        )
                      : Container();
                }),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                text ?? '',
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
