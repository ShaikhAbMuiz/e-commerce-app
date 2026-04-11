import 'package:e_commerce/common/styles/shadow.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';

import 'package:e_commerce/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_details.dart';
import 'package:e_commerce/utils/constants/colors.dart';

import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UProductCardVertical extends StatelessWidget {
  const UProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailsScreen()),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: UShadows.verticalProductShadow,
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: dark ? UColors.darkerGrey : UColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail,Favorite Button And DisCount Tag
            URoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.light,
              child: Stack(
                children: [
                  /// Thumbnail
                  Center(
                    child: URoundedImage(
                      imageUrl: UImages.product15Image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),

                  /// Discount Tag
                  Positioned(
                    top: 12.0,
                    child: URoundedContainer(
                      radius: USizes.sm,
                      backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                      padding: EdgeInsets.symmetric(
                        horizontal: USizes.sm,
                        vertical: USizes.xs,
                      ),
                      child: Text(
                        "20%",
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: UColors.dark),
                      ),
                    ),
                  ),

                  /// Favorite Button
                  Positioned(
                    right: 0.0,
                    top: 0.0,
                    child: UCircularIcon(
                      icon: Iconsax.heart5,
                      color: UColors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: USizes.spaceBtwItems / 2),

            /// PRODUCT INFORMATION
            Padding(
              padding: const EdgeInsets.only(left: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Product Title
                  UProductTitleText(title: "Blue bata shoes", smallSize: true),
                  SizedBox(height: USizes.spaceBtwItems / 2),

                  /// Product Brand and Verified Icon
                  UBrandTitleWithVerifyIcon(title: "Bata"),
                ],
              ),
            ),
            Spacer(),

            /// Product Price and Add To Cart Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Product Price
                Padding(
                  padding: const EdgeInsets.only(left: USizes.sm),
                  child: UProductPriceText(price: "65"),
                ),

                /// Add To Cart Button
                Container(
                  width: USizes.iconLg * 1.2,
                  height: USizes.iconLg * 1.2,
                  decoration: BoxDecoration(
                    color: UColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(USizes.cardRadiusMd),
                      bottomRight: Radius.circular(USizes.productImageRadius),
                    ),
                  ),
                  child: Icon(Iconsax.add, color: UColors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
