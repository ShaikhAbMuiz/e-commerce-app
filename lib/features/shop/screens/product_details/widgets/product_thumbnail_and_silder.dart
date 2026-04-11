import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Container(
      color: dark ? UColors.darkerGrey : UColors.light,
      child: Stack(
        children: [
          /// [image] --- Main Image OR Thumbnail
          SizedBox(
            width: double.infinity,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(USizes.productImageRadius * 2),
              child: Center(
                child: Image(image: AssetImage(UImages.productImage30)),
              ),
            ),
          ),

          ///Image Slider
          Positioned(
            left: USizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80.0,
              child: ListView.separated(
                separatorBuilder:
                    (context, index) =>
                        const SizedBox(width: USizes.spaceBtwItems),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder:
                    (context, index) => URoundedImage(
                      border: Border.all(color: UColors.primary),
                      padding: EdgeInsets.all(USizes.sm),
                      backgroundColor: dark ? UColors.dark : UColors.white,
                      width: 80,
                      imageUrl: UImages.product15Image,
                    ),
              ),
            ),
          ),

          /// [AppBar] ---- back Arrow and favorite button
          UAppBar(
            showBackArrow: true,
            actions: [UCircularIcon(icon: Iconsax.heart5, color: UColors.red)],
          ),
        ],
      ),
    );
  }
}
