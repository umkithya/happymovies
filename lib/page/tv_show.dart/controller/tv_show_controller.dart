import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class TVShowController extends GetxController {
  final activeIndex = 0.obs;
  final carouselControllerCard = CarouselController ().obs;
  final carouselControllerImage = CarouselController ().obs;
}
