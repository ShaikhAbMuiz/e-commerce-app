import 'package:e_commerce/common/widgets/chip/choice_chip.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';

class UProductAttributes extends StatelessWidget {
  const UProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attributes Priceing & Descripetion.
        URoundedContainer(
          padding: const EdgeInsets.all(USizes.sm),
          backgroundColor: dark ? UColors.dark : UColors.light,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title , Price , Stock
              Row(
                children: [
                  /// [Text] - Variaction Heading
                  USectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  SizedBox(width: USizes.spaceBtwItems),
    
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Price , Sale Price , Actual Price
                      Row(
                        children: [
                          /// [Text] - Price
                          UProductTitleText(
                            title: "Price : ",
                            smallSize: true,
                          ),
    
                          /// Actual Price
                          Text(
                            "250",
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall!.apply(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: USizes.spaceBtwItems),
    
                          /// Sale Price
                          UProductPriceText(price: "200"),
                        ],
                      ),
    
                      /// Stock Status
                      Row(
                        children: [
                          UProductTitleText(
                            title: "Stock : ",
                            smallSize: true,
                          ),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
    
              /// Description Heading and Description Text
              UProductTitleText(
                title: "This is a product of iPhone 11 with 512 GB",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        SizedBox(height: USizes.spaceBtwItems),
    
        /// Colors Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            USectionHeading(title: "Colors", showActionButton: false),
            SizedBox(height: USizes.spaceBtwItems / 2),
            Wrap(
              spacing: USizes.sm,
              children: [
                UChoiceChip(
                  text: "Red",
                  selected: true,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: "Blue",
                  selected: false,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
    
        /// Size Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            USectionHeading(title: "Colors", showActionButton: false),
            SizedBox(height: USizes.spaceBtwItems / 2),
            Wrap(
              spacing: USizes.sm,
              children: [
                UChoiceChip(
                  text: "Small",
                  selected: true,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: "Medium",
                  selected: false,
                  onSelected: (value) {},
                ),
                UChoiceChip(
                  text: "Large",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
