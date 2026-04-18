import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/cart_items.dart';
import '../../../../../common/widgets/products/cart/product_quantity_with_add_remove.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';

class UCartItems extends StatelessWidget {
  const UCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder:
          (context, index) => const SizedBox(height: USizes.spaceBtwSections),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          children: [
            /// Cart Items
            UCartItem(),
            if (showAddRemoveButton) SizedBox(height: USizes.spaceBtwItems),

            /// Price , counter button
            if (showAddRemoveButton)
              Row(
                children: [
                  /// Extra Space
                  SizedBox(width: 70.0),

                  /// Quantity Button
                  UProductQuantityWithAddRemove(),
                  Spacer(),

                  /// Product Price
                  UProductPriceText(price: "326"),
                ],
              ),
          ],
        );
      },
    );
  }
}
