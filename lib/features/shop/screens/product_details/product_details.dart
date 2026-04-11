import 'package:e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_thumbnail_and_silder.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = UHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --------[Products Image With Sliders]--------
            UProductThumbnailAndSlider(),

            /// -----------[Products Details]------------
            /// Prices,Title, Stock and Brand
            UProductMetaData(),

            /// Attributes
            /// Checkout Button
            /// Description
          ],
        ),
      ),

      /// --------[Bottom Navigation Bar]--------
    );
  }
}
