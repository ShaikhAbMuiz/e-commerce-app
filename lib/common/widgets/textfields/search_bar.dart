import 'package:e_commerce/common/styles/shadow.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class USearchBar extends StatelessWidget {
  const USearchBar({super.key});
  // final String title;

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunction.isDarkMode(context);
    return Positioned(
      bottom: 0,
      right: USizes.spaceBtwSections,
      left: USizes.spaceBtwSections,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: USizes.md),
        height: USizes.searchBarHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(USizes.borderRadiusLg),
          color: dark ? UColors.dark : UColors.light,

          boxShadow: UShadows.searchBarShadow,
        ),
        child: Row(
          children: [
            /// Search Icon
            Icon(Iconsax.search_normal, color: UColors.darkGrey),
            SizedBox(width: USizes.spaceBtwItems),

            /// Title
            Text(
              UTexts.homeScreenSearchBarTitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
