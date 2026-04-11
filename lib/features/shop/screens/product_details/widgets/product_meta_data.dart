import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UPadding.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Sale Tag , Original Price and Sale Price , Share Button
          Row(
            children: [
              /// Sale Tag
              URoundedContainer(
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
              SizedBox(width: USizes.spaceBtwItems),

              /// Original Price
              Text(
                "\$250",
                style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: USizes.spaceBtwItems),

              /// Sale Price
              UProductPriceText(price: "200", islarge: true),
              Spacer(),

              /// Share button
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            ],
          ),
          SizedBox(height: USizes.spaceBtwItems / 1.5),

          /// Product Title
          UProductTitleText(title: "Beard Growth oil"),
          SizedBox(height: USizes.spaceBtwItems / 1.5),

          /// Product Status
          Row(
            children: [
              UProductTitleText(title: "Status"),
              SizedBox(width: USizes.spaceBtwItems),
              Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: USizes.spaceBtwItems / 1.5),
            ],
          ),

          /// Brand Image With Title
          Row(
            children: [
              /// Brand Image
              UCircularImage(
                padding: 0,
                image: UImages.appleLogo,
                width: 32,
                height: 32,
              ),
              SizedBox(width: USizes.spaceBtwItems),

              /// Brand Title
              UBrandTitleWithVerifyIcon(title: "Beard "),
            ],
          ),
        ],
      ),
    );
  }
}
