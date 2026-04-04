import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  /// Variable
  final carouselController = CarouselSliderController();
  RxInt currentIndex = 0.obs;

  /// Function
  /// Update Current Index
  void onPageChanged(int index){
    currentIndex.value = index;

  }
  
}
