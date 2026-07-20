import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/buttons/elevated_button.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_thumbnail_and_silder.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --------[Products Image With Sliders]--------
            UProductThumbnailAndSlider(product: product),

            /// -----------[Products Details]------------
            Padding(
              padding: UPadding.screenPadding,
              child: Column(
                /// Prices,Title, Stock and Brand
                children: [
                  UProductMetaData(product: product),
                  SizedBox(height: USizes.spaceBtwSections),

                  /// Attributes
                  if (product.productType ==
                      ProductType.variable.toString()) ...[
                    UProductAttributes(product: product),
                    SizedBox(height: USizes.spaceBtwSections),
                  ],

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
                      product.description ?? "",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Text(product.description ?? "", softWrap: true),
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
