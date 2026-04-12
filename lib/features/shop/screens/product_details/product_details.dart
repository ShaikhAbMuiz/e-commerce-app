import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/buttons/elevated_button.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_thumbnail_and_silder.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --------[Products Image With Sliders]--------
            UProductThumbnailAndSlider(),

            /// -----------[Products Details]------------
            /// Prices,Title, Stock and Brand
            Padding(
              padding: UPadding.screenPadding,
              child: Column(
                children: [
                  UProductMetaData(),

                  /// Attributes
                  UProductAttributes(),
                  SizedBox(height: USizes.spaceBtwSections),

                  /// Checkout Button
                  UElevatedButton(onPressed: () {}, child: Text('Checkout')),
                  SizedBox(height: USizes.spaceBtwSections / 2),

                  /// Description

                  // SizedBox(height: USizes.spaceBtwItems),
                  ExpandablePanel(
                    theme: ExpandableThemeData(
                      iconColor: dark ? UColors.white : UColors.dark,
                     
                    ),
                    header: Text(
                      "Description",
                      style: Theme.of(context).textTheme.headlineSmall,
                      softWrap: true,
                    ),
                    collapsed: Text(
                      "This is short text This is the full text. Here you can show long descriptions, onboarding details, or API data.This is the full text. Here you can show long descriptions, onboarding details, or API data.This is the full text. Here you can show long descriptions, onboarding details, or API data.",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Text(
                      "This is short text This is the full text. Here you can show long descriptions, onboarding details, or API data.This is the full text. Here you can show long descriptions, onboarding details, or API data.This is the full text. Here you can show long descriptions, onboarding details, or API data.",
                      softWrap: true,
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),

      /// --------[Bottom Navigation Bar]--------
      bottomNavigationBar: UBottomAddToCart(),
    );
  }
}
