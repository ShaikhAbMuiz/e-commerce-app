import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBillingAmountSection extends StatelessWidget {
  const UBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Subtotal
        Row(
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Spacer(),
            Text("\$7997.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        // Shipping Fee
        Row(
          children: [
            Text("Shipping Fee", style: Theme.of(context).textTheme.bodyMedium),
            Spacer(),
            Text("\$32.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        // Tax Fee
        Row(
          children: [
            Text("Tax Fee", style: Theme.of(context).textTheme.bodyMedium),
            Spacer(),
            Text("\$231.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems),

        // Order Total
        Row(
          children: [
            Text(
              "Order Total",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Spacer(),
            Text("\$8663.0", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
