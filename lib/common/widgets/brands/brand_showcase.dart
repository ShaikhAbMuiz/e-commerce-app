import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';

class UBrandShowCase extends StatelessWidget {
  const UBrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return URoundedContainer(
      showBoader: true,
      backgroundColor: Colors.transparent,
      borderColor: UColors.darkGrey,
      padding: EdgeInsets.all(USizes.md),
      margin: EdgeInsets.only(bottom: USizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Brand with Product Count
          UBrandCard(showBoader: false),

          Row(
            children:
                images.map((image) => buildBrandImage(dark, image)).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildBrandImage(bool dark, String image) {
    return Expanded(
      child: URoundedContainer(
        height: 100,
        margin: const EdgeInsets.only(right: USizes.sm),
        padding: const EdgeInsets.all(USizes.md),
        backgroundColor: dark ? UColors.darkGrey : UColors.light,
        child: Image(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
