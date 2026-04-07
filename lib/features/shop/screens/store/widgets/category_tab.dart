import 'package:e_commerce/common/widgets/brands/brand_showcase.dart';
import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Showcase 1
              UBrandShowCase(
                images: [
                  UImages.productImage47,
                  UImages.productImage48,
                  UImages.productImage45a,
                ],
              ),

              /// Brand Showcase 2
              UBrandShowCase(
                images: [
                  UImages.productImage47,
                  UImages.productImage48,
                  UImages.productImage45a,
                ],
              ),
              SizedBox(height: USizes.spaceBtwItems),


/// You might like Section Heading
              USectionHeading(title: "You might like", onPressed: () {}),

/// Grid Layout Products
              UGrideLayout(
                itemCount: 4,
                itemBuilder: (context, index) => const UProductCardVertical(),
              ),

              SizedBox(height: USizes.spaceBtwItems),
            ],
          ),
        ),
      ],
    );
  }
}
