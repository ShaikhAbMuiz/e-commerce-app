import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/screens/brands/brand_products.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        title: Text("Brand", style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              /// Text ----[Brands]
              USectionHeading(title: "Brand", showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),

              UGrideLayout(
                itemCount: 10,
                itemBuilder:
                    (context, index) => UBrandCard(
                      onTap: () => Get.to(() => BrandProductsScreen()),
                    ),
                mainAxisExtent: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
