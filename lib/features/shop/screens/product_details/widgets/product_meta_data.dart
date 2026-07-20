import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../controllers/product/product_controller.dart';
import '../../../models/product_model.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    String? salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePrice,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Sale Tag , Original Price and Sale Price , Share Button , Product Title , Product Status , Brand Image With Title
        Row(
          children: [
            /// Sale Tag
            if (salePercentage != null) ...[
              URoundedContainer(
                radius: USizes.sm,
                backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                padding: EdgeInsets.symmetric(
                  horizontal: USizes.sm,
                  vertical: USizes.xs,
                ),
                child: Text(
                  "$salePercentage% Off",
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.apply(color: UColors.dark),
                ),
              ),
              SizedBox(width: USizes.spaceBtwItems),
            ],

            /// Actual Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0) ...[
              Text(
                "${UTexts.currency} ${product.price.toStringAsFixed(0)}",
                style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: USizes.spaceBtwItems),
            ],

            /// Sale Price or Actual Price
            UProductPriceText(
              price: controller.getProductPrice(product),
              islarge: true,
            ),
            Spacer(),

            /// Share button
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Product Title
        UProductTitleText(title: product.title, maxLines: 2),
        SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Product Status
        Row(
          children: [
            UProductTitleText(title: "Status"),
            SizedBox(width: USizes.spaceBtwItems),
            Text(
              controller.getProductStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: USizes.spaceBtwItems / 1.5),
          ],
        ),

        /// Brand Image With Title
        Row(
          children: [
            /// Brand Image
            UCircularImage(
              padding: 0,
              isNetworkImage: true,
              image: product.brand != null ? product.brand!.image : "",
              width: 32,
              height: 32,
            ),
            SizedBox(width: USizes.spaceBtwItems),

            /// Brand Title
            UBrandTitleWithVerifyIcon(
              title: product.brand != null ? product.brand!.name : "",
            ),
          ],
        ),
      ],
    );
  }
}
