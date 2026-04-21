import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductCardHorizontal extends StatelessWidget {
  const UProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: dark ? UColors.darkerGrey : UColors.light,
        borderRadius: BorderRadius.circular(USizes.borderRadiusLg),
      ),
      child: Row(
        children: [
          // Left Portion
          URoundedContainer(
            padding: EdgeInsets.all(USizes.sm),
            height: 120,
            backgroundColor: dark ? UColors.dark : UColors.white,
            child: Stack(
              children: [
                // Thambnail
                SizedBox(
                  width: 120,
                  height: 120,
                  child: URoundedImage(imageUrl: UImages.productImage30),
                ),

                /// DisCount Tag
                Positioned(
                  top: 12.0,
                  child: URoundedContainer(
                    radius: USizes.sm,
                    backgroundColor: UColors.yellow.withValues(alpha: 0.9),
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

          /// Right Portion
          SizedBox(
            width: 170.0,
            child: Padding(
              padding: const EdgeInsets.only(left: USizes.sm, top: USizes.sm),
              // Product Title and Brand
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UProductTitleText(
                        title: "iPhone 13 Pro Max",
                        // maxLines: 1,
                        smallSize: true,
                      ),
                      SizedBox(height: USizes.spaceBtwItems / 2),

                      // Product Brand
                      UBrandTitleWithVerifyIcon(
                        title: "Apple",
                        brandTextSize: TextSizes.small,
                        // iconColor: UColors.,
                      ),
                    ],
                  ),
                  Spacer(),

                  /// Product Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: UProductPriceText(price: "45")),

                      Container(
                        width: USizes.iconLg * 1.2,
                        height: USizes.iconLg * 1.2,
                        decoration: BoxDecoration(
                          color: UColors.primary,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(USizes.borderRadiusLg),
                            topLeft: Radius.circular(USizes.borderRadiusLg),
                          ),
                        ),
                        child: Icon(Icons.add, color: UColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
