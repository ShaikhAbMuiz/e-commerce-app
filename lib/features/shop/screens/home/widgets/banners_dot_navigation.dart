
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controllers/banner/banner_controller.dart';

class BannersDotNavgation extends StatelessWidget {
  const BannersDotNavgation({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());

    return Obx(
      () => SmoothPageIndicator(
        controller: PageController(
          initialPage: bannerController.currentIndex.value,
        ),
        count: bannerController.banners.length,
        effect: ExpandingDotsEffect(dotHeight: 6.0),
      ),
    );
  }
}
