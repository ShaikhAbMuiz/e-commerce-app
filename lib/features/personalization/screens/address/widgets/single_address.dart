import 'package:e_commerce/common/widgets/custom_shapes/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class USingleAddress extends StatelessWidget {
  const USingleAddress({super.key, required this.isSelected});

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return URoundedContainer(
      borderColor:
          isSelected
              ? Colors.transparent
              : dark
              ? UColors.darkerGrey
              : UColors.grey,
      backgroundColor:
          isSelected
              ? UColors.primary.withValues(alpha: 0.5)
              : Colors.transparent,
      width: double.infinity,
      showBoader: true,
      padding: const EdgeInsets.all(USizes.md),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ? Name
              Text(
                "Abdul Muiz",
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),

              // ? Phone Number
              Text(
                "+9123456789",
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: USizes.spaceBtwItems / 2),

              // ? Address
              Text("House no.25A ,Maharastra ,Jalgaon ,India"),
            ],
          ),

          // ? Edit Icon
          if (isSelected)
            Positioned(
              top: 0,
              bottom: 0,
              right: 6,
              child: Icon(Iconsax.tick_circle5),
            ),
        ],
      ),
    );
  }
}
