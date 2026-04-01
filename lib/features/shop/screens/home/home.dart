import 'package:e_commerce/common/widgets/textfields/search_bar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
    );
  }
}
