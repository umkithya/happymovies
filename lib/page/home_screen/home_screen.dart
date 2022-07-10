import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:happymovie/page/home_screen/controller/home_screen_controller.dart';
import 'package:happymovie/page/home_screen/model/popular_movie_model/popular_movies_model/movies_model.dart';
import 'package:happymovie/page/movies_page/controller/movies_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../config/route/app_route.gr.dart';
import '../../widgets/custom_shimmer_box/custom_shimmer_box.dart';
import '../tv_show.dart/controller/tv_show_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final homeController = Get.put(HomeScreenController());
  final moviesController = Get.put(MoviesController());
  final tvshowController = Get.put(TVShowController());
  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    // _homeController.fetchPopularMovie();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xFF141414),
        // backgroundColor: Colors.white,
        // appBar: AppBar(
        //   leading: const Padding(
        //     padding: EdgeInsets.only(left: 20),
        //     child: Icon(
        //       CupertinoIcons.search,
        //       color: Colors.white,
        //       size: 35,
        //     ),
        //   ),
        //   title: Image.asset(
        //     'asset/logo-one.png',
        //     fit: BoxFit.fill,
        //     height: 40,
        //     width: 200,
        //   ),
        //   centerTitle: true,
        //   elevation: 0,
        //   backgroundColor: const Color(0xFF141414),
        // ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: ListView(
                // physics: const NeverScrollableScrollPhysics(),
                controller: ScrollController(),
                children: [
                  // //popular title:

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 60, left: 0, right: 0),
                  //   child: Stack(
                  //     children: [
                  // CachedNetworkImage(
                  //   imageUrl:
                  //       'https://poetryschool.com/assets/uploads/2014/12/PosterCollage.jpg',
                  //   fit: BoxFit.cover,
                  //   height: 300,
                  //   width: double.infinity,
                  //   progressIndicatorBuilder:
                  //       (context, url, downloadProgress) =>
                  //           const ShimmerBox(height: 200),
                  //   errorWidget: (context, url, error) =>
                  //       const Icon(Icons.error),
                  // ),
                  // Container(
                  //   height: 300,
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       gradient: LinearGradient(
                  //           begin: FractionalOffset.topCenter,
                  //           end: FractionalOffset.bottomCenter,
                  //           colors: [
                  //             Colors.black.withOpacity(0.2),
                  //             const Color(0xFF141414),
                  //           ],
                  //           stops: const [
                  //             0.3,
                  //             1.5
                  //           ])),
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 0),
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 0, right: 0),
                    child: CarouselSlider(
                        carouselController: controller,
                        items: homeController.homeImageSliderList
                            .map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: e,
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                      memCacheHeight: (200 *
                                              MediaQuery.of(context)
                                                  .devicePixelRatio)
                                          .round(),
                                      memCacheWidth: 250,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              const ShimmerBox(
                                        height: 200,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ))
                            .toList(),
                        options: CarouselOptions(
                          onPageChanged: (index, carouselPageChangedReason) {
                            homeController.activeIndex.value = index;
                          },
                          height: 200,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          initialPage: 0,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          // aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          autoPlay: true,
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 0, bottom: 30),
                    // top: 0,
                    // left: 0,
                    // right: 0,
                    // bottom: 40,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedSmoothIndicator(
                        count: 6,
                        curve: Curves.easeInOutBack,

                        effect: const ScrollingDotsEffect(
                            spacing: 10,
                            radius: 0,
                            dotWidth: 20,
                            dotHeight: 4,
                            //paintStyle: PaintingStyle.stroke,
                            strokeWidth: 1.5,
                            dotColor: Color(0xFF555555),
                            activeDotColor: Color(0xFFFFFFFF)),
                        // your preferred effect
                        onDotClicked: (index) {
                          //controller.animateToPage(index);
                        },
                        activeIndex: (homeController.activeIndex.value),
                      ),
                    ),
                  ),
                  // ],
                  // ),
                  // ),

                  //category card
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 20, right: 0),
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
                                    moviesController.appBarTitle.value =
                                        e.title!;
                                    context.router
                                        .push(const MoviesPageRoute());
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
                    padding: const EdgeInsets.only(top: 30, left: 0, right: 0),
                    child: SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://www.whatisthematrix.com/assets/images/desktopbanner.jpg',
                        fit: BoxFit.cover,
                        memCacheHeight:
                            (55 * MediaQuery.of(context).devicePixelRatio)
                                .round(),
                        // memCacheWidth: 200,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                const ShimmerBox(
                          height: 55,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  //popular title:
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 20, right: 20),
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
                            moviesController.appBarTitle.value =
                                'Popular Movies';
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
                        top: 30, bottom: 0, left: 20, right: 0),
                    child: SizedBox(
                      height: 280,
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
                                                VideoDetailRoute(
                                                    moviesModel: e));
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
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
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
                        top: 30, bottom: 10, left: 20, right: 0),
                    child: SizedBox(
                      height: 280,
                      child: ListView(
                        // physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: tvshowController.tvshowListCard
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
                        top: 50, left: 0, bottom: 10, right: 0),
                    child: SizedBox(
                      height: 45,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: homeController.languageList
                            .map((e) => customCategoryCard(
                                isUnHideImage: false,
                                height: 45,
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
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
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
                        const EdgeInsets.only(top: 30, bottom: 80, left: 20),
                    child: SizedBox(
                      height: 280,
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
            ),
            Container(
              height: 80,
              width: double.maxFinite,
              color: const Color(0xFF171C20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 30, bottom: 5),
                    child: Image.asset('asset/logo-s.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20, top: 20),
                    child: Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
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
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: 150,
        child: Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: '$imgUrl',
                      fit: BoxFit.fill,
                      memCacheHeight:
                          (150 * MediaQuery.of(context).devicePixelRatio)
                              .round(),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => ShimmerBox(
                        height: 150,
                        width: 100,
                        isColor: true,
                        color: Colors.red[100],
                        baseColor: Colors.grey[400],
                        highlightColor: Colors.white,
                        radius: 10,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
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
                bottom: 20,
                child: SizedBox(
                  width: 150,
                  height: 22,
                  child: AutoSizeText(
                    title ?? '',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    minFontSize: 14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      '$rate',
                      style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
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
        decoration: isUnHideImage! != true
            ? BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8))
            : null,
        child: Stack(
          children: [
            Visibility(
              visible: isUnHideImage,
              child: SizedBox(
                width: width,
                height: height,
                // decoration: const BoxDecoration(color: Colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: '$imgUrl',
                    fit: BoxFit.fill,
                    color: color,
                    memCacheHeight: 100,
                    width: 50,
                    colorBlendMode: BlendMode.color,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => ShimmerBox(
                      height: width,
                      width: height,
                      isColor: true,
                      color: Colors.red[100],
                      baseColor: Colors.grey[400],
                      highlightColor: Colors.white,
                      radius: 10,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isUnHideImage,
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.1),
                          const Color(0xFF141414),
                        ],
                        stops: const [
                          0.2,
                          1.0,
                        ])),
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
