import 'package:e_commerce/common/widgets/textfields/search_bar.dart';
import 'package:e_commerce/features/shop/controllers/home/home_controller.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          /// ------------------------[Upper Part]-------------------------
          Stack(
            children: [
              /// Total Height + 20
              SizedBox(height: USizes.primaryHeaderHeight + 10),

              /// Primary Header Container
              UPrimaryHeaderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Appbar
                    UHomeAppBar(),
                    SizedBox(height: USizes.spaceBtwSections),

                    /// Cetegories
                    UHomeCategories(),
                  ],
                ),
              ),

              /// Search Bar
              USearchBar(),
            ],
          ),

          /// ------------------------[Lower Part]-------------------------
          /// Banner
          Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace),
            child: UPromoSlider(
              banners: [
                UImages.homeBanner1,
                UImages.homeBanner2,
                UImages.homeBanner3,
                UImages.homeBanner4,
                UImages.homeBanner5,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
