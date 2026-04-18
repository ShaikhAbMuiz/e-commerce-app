import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';

class UBillingPaymentSection extends StatelessWidget {
  const UBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Column(
      children: [
        // [Text] --- Payment Methods ---
        USectionHeading(
          title: "Payment Methods",
          buttonTitle: "Change",
          onPressed: () {},
        ),
        // SizedBox(height: USizes.spaceBtwItems),

        // Payment Logo
        Row(
          children: [
            URoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? UColors.light : UColors.white,
              padding: EdgeInsets.all(USizes.sm),
              child: Image(
                image: AssetImage(UImages.masterCard),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: USizes.spaceBtwItems / 2),


            // Payment Name
            Text("Master Card", style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
