import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class UCategoryShimmer extends StatelessWidget {
  const UCategoryShimmer({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder:
            (context, index) => const SizedBox(width: USizes.spaceBtwItems),
        itemBuilder:
            (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // [Image]
                UShimmerEffect(height: 55, width: 55, radius: 55),
                SizedBox(height: USizes.spaceBtwItems / 2),
                // [Text]
                UShimmerEffect(height: 8, width: 55),
              ],
            ),
      ),
    );
  }
}
