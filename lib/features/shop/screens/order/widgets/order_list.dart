import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UOrderListItem extends StatelessWidget {
  const UOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return ListView.separated(
      separatorBuilder:
          (context, index) => const SizedBox(height: USizes.spaceBtwItems),
      itemCount: 10,
      itemBuilder: (context, index) {
        return URoundedContainer(
          showBoader: true,
          backgroundColor: dark ? UColors.dark : UColors.light,
          padding: UPadding.screenPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1 - Row
              Row(
                children: [
                  // Shipping Icon
                  Icon(Iconsax.ship),
                  SizedBox(width: USizes.spaceBtwItems / 2),

                  // Shipping Status
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Processing",
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: UColors.primary,
                            fontWeightDelta: 1,
                          ),
                        ),

                        /// Shipping Date
                        Text(
                          "01 Jan 2023",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  // Arrow IconButton
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Iconsax.arrow_right_34, size: USizes.iconSm),
                  ),
                ],
              ),
              SizedBox(height: USizes.spaceBtwItems),

              /// 2 -Row
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // Tag Icon
                        Icon(Iconsax.tag),
                        SizedBox(width: USizes.spaceBtwItems / 2),

                        // Order Text and Order ID
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Order Text
                              Text(
                                "Order",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),

                              /// Order ID
                              Text(
                                "787987",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Calendar Icon and Shapping Date
                  Expanded(
                    child: Row(
                      children: [
                        // Calendar Icon
                        Icon(Iconsax.calendar),
                        SizedBox(width: USizes.spaceBtwItems / 2),

                        // Shapping Date and Date
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Shapping Date
                              Text(
                                "Shapping Date",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              // Date
                              Text(
                                "01 Jan 2023",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
