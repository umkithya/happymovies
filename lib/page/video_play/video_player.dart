import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:happymovie/page/home_screen/model/popular_movie_model/popular_movies_model/movies_model.dart';

import 'controller/video_play_controller.dart';

class VideoPlayer extends StatelessWidget {
  VideoPlayer({Key? key, this.moviesModel}) : super(key: key);
  final MoviesModel? moviesModel;

  final videoPlayerCon = Get.put(VideoPlayPageController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      drawerEnableOpenDragGesture: false,
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(
          key: UniqueKey(),
          controller: BetterPlayerController(
              BetterPlayerConfiguration(
                  expandToFill: true,
                  autoPlay: true,
                  autoDispose: true,
                  aspectRatio: 16 / 9,
                  fit: BoxFit.fill,
                  translations: videoPlayerCon.translations),
              betterPlayerDataSource: BetterPlayerDataSource(
                  BetterPlayerDataSourceType.network,
                  'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',
                  subtitles: videoPlayerCon.sub,
                  bufferingConfiguration:
                      const BetterPlayerBufferingConfiguration(),
                  placeholder: CachedNetworkImage(
                    imageUrl: moviesModel!.thumbnailUrl!,
                    memCacheHeight: 150,
                    memCacheWidth: 200,
                  ),
                  resolutions: {
                    "LOW":
                        "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4",
                    "MEDIUM":
                        "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_640_3MG.mp4",
                    "LARGE":
                        "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1280_10MG.mp4",
                    "EXTRA_LARGE":
                        "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1920_18MG.mp4"
                  })),
        ),
      ),
    );
  }
}
// Center(
//         child: FutureBuilder<Map<String, VideoSource>>(
//           future: VideoSource.fromM3u8PlaylistUrl(
//             moviesModel!.m3u8UrlServer1!,
//             formatter: (quality) => quality == "Auto"
//                 ? "Automatic"
//                 : "${quality.split("x").last}p",

//             // formatter: (quality) =>
//             //     quality == "Auto" ? "Automatic" : "${quality.split("x").last}p",
//             initialSubtitle: "",
//             subtitle: {
//               "English": VideoViewerSubtitle.network(
//                 "https://raw.githubusercontent.com/umkithya/subtitiles/srt-page/Spider-Man_-No-Way-Home_2021_English-ELSUBTITLE.COM-ST_65658054%20(2).srt",
//                 type: SubtitleType.srt,
//               ),
//               "Khmer": VideoViewerSubtitle.network(
//                 "https://raw.githubusercontent.com/umkithya/subtitiles/umkithya-patch-1/Spider-Man_-No-Way-Home_2021_English-ELSUBTITLE.COM-ST_65658054.km.srt",
//                 type: SubtitleType.srt,
//               ),
//             },
//           ),
//           builder: (_, data) {
//             return data.hasData
//                 ? VideoViewer(
//                     enableFullscreenScale: true,
//                     autoPlay: true,
                    
//                     source: {
//                       "1080p": VideoSource(
//                           video: VideoPlayerController.network(
//                               moviesModel!.m3u8UrlServer1!)),
//                       "720p": VideoSource(
//                           video: VideoPlayerController.network(
//                               "https://e-5.mzzcloud.life/_v8/416b37f0473b2b8ba466f6211294852bb1ff266f62f9610aef08a5bd3349a19e5fd564dfd103aa470b553a97ca02f76dfa589b52234a11e9301eab5503c87952dfd5c5bf168329cd5dc8bae66b2ca44244ca19894f0f683946d2bdb5d7985d0970008af771427e7b1ff0b2dd6009fdce3219172776102be605cc6df40324c4b2/360/index.m3u8")),
//                     },
//                     onFullscreenFixLandscape: false,
//                     style: VideoViewerStyle(
//                       thumbnail: Image.network(
//                         moviesModel!.thumbnailUrl!,
//                       ),
//                     ),
//                   )
//                 : const Center(
//                     child: CircularProgressIndicator(
//                     color: Colors.red,
//                   ));
//           },
//         ),
//       ),