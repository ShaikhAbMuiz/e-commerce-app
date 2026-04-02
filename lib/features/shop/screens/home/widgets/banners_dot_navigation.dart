import 'package:e_commerce/features/shop/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannersDotNavgation extends StatelessWidget {
  const BannersDotNavgation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;

    return Obx(
      () => SmoothPageIndicator(
        controller: PageController(initialPage: controller.currentIndex.value),
        count: 5,
        effect: ExpandingDotsEffect(dotHeight: 6.0),
      ),
    );
  }
}
