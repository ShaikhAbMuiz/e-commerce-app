import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({super.key, this.showBoader = true});

  final bool showBoader;
  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      height: USizes.brandCardHeight,
      width: USizes.brandCardWidth,
      showBoader: showBoader,
      padding: EdgeInsets.all(USizes.sm),
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
          /// Brand Image
          Flexible(
            child: URoundedImage(
              imageUrl: UImages.bataLogo,
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(width: USizes.spaceBtwItems / 2),

          ///Brand Name & Verify Icon and Product Count
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ///Brand Name & Verify Icon
                UBrandTitleWithVerifyIcon(
                  title: "Bata",
                  brandTextSize: TextSizes.large,
                ),

                /// Product Count Text
                Text(
                  "172 Products diuahdauiduioaouide",
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
