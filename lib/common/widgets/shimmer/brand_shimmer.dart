import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class UBrandShimmer extends StatelessWidget {
  const UBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder:
          (context, index) => UShimmerEffect(
            width: USizes.brandCardWidth,
            height: USizes.brandCardHeight,
          ),
      itemCount: itemCount,
      separatorBuilder:
          (context, index) => SizedBox(width: USizes.spaceBtwItems),
    );
  }
}
