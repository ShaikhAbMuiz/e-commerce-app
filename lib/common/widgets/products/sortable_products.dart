import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class USortableProducts extends StatelessWidget {
  const USortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filters Section
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items:
              ["Name", "Lower Price", "Higher Price", "Sale", "New"].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
          onChanged: (value) {},
        ),

        SizedBox(height: USizes.spaceBtwSections),

        // Products
        UGrideLayout(
          itemCount: 10,
          itemBuilder: (context, index) {
            return UProductCardVertical();
          },
        ),
      ],
    );
  }
}
