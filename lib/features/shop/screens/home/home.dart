import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/textfields/search_bar.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controllers/home/home_controller.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ------------------------[Upper Part]-------------------------
            Stack(
              children: [
                /// Total Height + 20
                SizedBox(height: USizes.homePrimaryHeaderHeight + 10),

                /// Primary Header Container
                UPrimaryHeaderContainer(
                  height: USizes.homePrimaryHeaderHeight,
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
              child: Column(
                children: [
                  /// Banner
                  UPromoSlider(
                    banners: [
                      UImages.homeBanner1,
                      UImages.homeBanner2,
                      UImages.homeBanner3,
                      UImages.homeBanner4,
                      UImages.homeBanner5,
                    ],
                  ),
                  SizedBox(height: USizes.spaceBtwSections),

                  /// Section Heading --- Popular Products
                  USectionHeading(
                    title: UTexts.popularProductsTitle,
                    onPressed: () => Get.to(() => const AllProductsScreen()),
                  ),
                  SizedBox(height: USizes.spaceBtwItems),

                  /// GridView of Products Card
                  UGrideLayout(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return UProductCardVertical();
                    },
                  ),
                ],
              ),
            ),

            ///
          ],
        ),
      ),
    );
  }
}
