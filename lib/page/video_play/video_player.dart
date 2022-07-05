import 'package:flutter/material.dart';
import 'package:happymovie/page/home_screen/model/popular_movie_model/popular_movies_model/movies_model.dart';
import 'package:video_viewer/video_viewer.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({Key? key, this.moviesModel}) : super(key: key);
  final MoviesModel? moviesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      extendBody: true,
      drawerEnableOpenDragGesture: false,
      body: Center(
        child: FutureBuilder<Map<String, VideoSource>>(
          future: VideoSource.fromM3u8PlaylistUrl(
            moviesModel!.m3u8UrlServer1!,

            // formatter: (quality) =>
            //     quality == "Auto" ? "Automatic" : "${quality.split("x").last}p",
            initialSubtitle: "",
            subtitle: {
              "English": VideoViewerSubtitle.network(
                "https://raw.githubusercontent.com/umkithya/subtitiles/srt-page/Spider-Man_-No-Way-Home_2021_English-ELSUBTITLE.COM-ST_65658054%20(2).srt",
                type: SubtitleType.srt,
              ),
              "Khmer": VideoViewerSubtitle.network(
                "https://raw.githubusercontent.com/umkithya/subtitiles/umkithya-patch-1/Spider-Man_-No-Way-Home_2021_English-ELSUBTITLE.COM-ST_65658054.km.srt",
                type: SubtitleType.srt,
              ),
            },
          ),
          builder: (_, data) {
            return data.hasData
                ? VideoViewer(
                    autoPlay: true,
                    source: data.data!,
                    onFullscreenFixLandscape: true,
                    style: VideoViewerStyle(
                      thumbnail: Image.network(
                        moviesModel!.thumbnailUrl!,
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
