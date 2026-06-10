import 'package:e_commerce/common/widgets/appbar/tabbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/screens/brands/all_brands.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/shimmer/brand_shimmer.dart';
import '../../controllers/brand/brand_controller.dart';
import '../../controllers/category/category_controller.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: controller.featuredCategories.length,
      child: Scaffold(
        /// Appbar
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 340,
                automaticallyImplyLeading: false,
                pinned: true,
                floating: false,

                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// Primary Header
                      UStorePrimaryHeader(),
                      const SizedBox(height: USizes.spaceBtwItems),

                      /// Brand Heading
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: USizes.defaultSpace,
                        ),
                        child: Column(
                          children: [
                            USectionHeading(
                              title: "Brand",
                              onPressed: () => Get.to(() => BrandScreen()),
                            ),

                            /// Brand Card
                            SizedBox(
                              height: 70.0,
                              child: Obx(() {
                                // [Loading] - State
                                if (brandController.isLoading.value) {
                                  return const Center(child: UBrandShimmer());
                                }

                                // [Empty] - State
                                if (brandController.featuredBrands.isEmpty) {
                                  return const Center(
                                    child: Text("No Brands Found"),
                                  );
                                }
                                // [DataFound] - State
                                return ListView.separated(
                                  separatorBuilder:
                                      (context, index) => const SizedBox(
                                        width: USizes.spaceBtwItems / 2,
                                      ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    BrandModel brand =
                                        brandController.featuredBrands[index];
                                    return SizedBox(
                                      width: USizes.brandCardWidth,
                                      child: UBrandCard(brand: brand),
                                    );
                                  },
                                  itemCount:
                                      brandController.featuredBrands.length,
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                bottom: UTabBar(
                  tabs:
                      controller.featuredCategories
                          .map((category) => Tab(text: category.name))
                          .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children:
                controller.featuredCategories
                    .map((category) => UCategoryTab())
                    .toList(),
          ),
        ),
      ),
    );
  }
}
