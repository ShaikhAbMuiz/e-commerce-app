import 'package:e_commerce/common/widgets/chip/choice_chip.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/texts.dart';
import '../../../controllers/product/variation_controller.dart';
import '../../../models/product_model.dart';

class UProductAttributes extends StatelessWidget {
  const UProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          /// Selected Attributes Priceing & Descripetion.
          if (controller.selectedVariation.value.id.isNotEmpty)
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
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  "${UTexts.currency}${controller.selectedVariation.value.price.toStringAsFixed(0)}",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleSmall!.apply(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              SizedBox(width: USizes.spaceBtwItems),

                              /// Sale Price
                              UProductPriceText(
                                price: controller.getVariationPrice(),
                              ),
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
                                controller.variationStockStatus.value,
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
                    title: controller.selectedVariation.value.description ?? "",
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
            children:
                product.productAttributes!.map((attribute) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      USectionHeading(
                        title: attribute.name ?? "",
                        showActionButton: false,
                      ),
                      SizedBox(height: USizes.spaceBtwItems / 2),
                      Wrap(
                        spacing: USizes.sm,
                        children:
                            attribute.values!.map((attributeValue) {
                              bool isSelected =
                                  controller.selectedAttributes[attribute
                                      .name] ==
                                  attributeValue;
                              bool available = controller
                                  .getAttributesAvailabilityInVariation(
                                    product.productVariations!,
                                    attribute.name!,
                                  )
                                  .contains(attributeValue);
                              return UChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected:
                                    available
                                        ? (selected) {
                                          if (available && selected) {
                                            controller.onAttributeSelected(
                                              product,
                                              attribute.name!,
                                              attributeValue,
                                            );
                                          }
                                        }
                                        : null,
                              );
                            }).toList(),
                      ),
                    ],
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}


/// Size Attributes
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     USectionHeading(title: "Colors", showActionButton: false),
        //     SizedBox(height: USizes.spaceBtwItems / 2),
        //     Wrap(
        //       spacing: USizes.sm,
        //       children: [
        //         UChoiceChip(
        //           text: "Small",
        //           selected: true,
        //           onSelected: (value) {},
        //         ),
        //         UChoiceChip(
        //           text: "Medium",
        //           selected: false,
        //           onSelected: (value) {},
        //         ),
        //         UChoiceChip(
        //           text: "Large",
        //           selected: false,
        //           onSelected: (value) {},
        //         ),
        //       ],
        //     ),
        //   ],
        // ),