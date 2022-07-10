import 'package:better_player/better_player.dart';
import 'package:get/get.dart';

class VideoPlayPageController extends GetxController {
  final select = 'One'.obs;
  final unhide = true.obs;
  var dataSourceList = <BetterPlayerDataSource>[
    BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    ),
    BetterPlayerDataSource(BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
    BetterPlayerDataSource(BetterPlayerDataSourceType.network,
        "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"),
  ];
  var translations = <BetterPlayerTranslations>[
    BetterPlayerTranslations(
      languageCode: 'kh',
    )
  ];
  var sub = <BetterPlayerSubtitlesSource>[
    BetterPlayerSubtitlesSource(
      type: BetterPlayerSubtitlesSourceType.network,
      urls: <String>[
        'https://raw.githubusercontent.com/umkithya/subtitiles/srt-page/Spider-Man_-No-Way-Home_2021_English-ELSUBTITLE.COM-ST_65658054%20(2).srt'
      ],
    )
  ];
  // createDataSet() {
  //   var dataSourceList = <BetterPlayerDataSource>[];
  //   dataSourceList.add(
  //     BetterPlayerDataSource(
  //       BetterPlayerDataSourceType.network,
  //       "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  //     ),
  //   );
  //   dataSourceList.add(
  //     BetterPlayerDataSource(BetterPlayerDataSourceType.network,
  //         "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
  //   );
  //   dataSourceList.add(
  //     BetterPlayerDataSource(BetterPlayerDataSourceType.network,
  //         "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"),
  //   );
  //   return dataSourceList;
  // }
  // dataSourceList.add(
  //   BetterPlayerDataSource(
  //     BetterPlayerDataSourceType.network,
  //     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  //   ),
  // );
  // dataSourceList.add(
  //   BetterPlayerDataSource(BetterPlayerDataSourceType.network,
  //       "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
  // );
  // dataSourceList.add(
  //   BetterPlayerDataSource(BetterPlayerDataSourceType.network,
  //       "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"),
  // );
}
