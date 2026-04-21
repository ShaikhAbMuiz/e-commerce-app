import 'package:e_commerce/common/widgets/appbar/tabbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/brands/all_brands.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                              child: ListView.separated(
                                separatorBuilder:
                                    (context, index) => const SizedBox(
                                      width: USizes.spaceBtwItems / 2,
                                    ),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder:
                                    (context, index) => SizedBox(
                                      width: USizes.brandCardWidth,
                                      child: const UBrandCard(),
                                    ),
                                itemCount: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                bottom: UTabBar(
                  tabs: [
                    Tab(text: "Sports"),
                    Tab(text: "Clothing"),
                    Tab(text: "Shoes"),
                    Tab(text: "Accessories"),
                    Tab(text: "Electronics"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
