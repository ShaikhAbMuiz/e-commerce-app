import 'package:e_commerce/common/widgets/custom_shapes/circular_container.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_edge_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

import 'package:flutter/material.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({
    super.key,
    required this.child,
    required this.height,
  });
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return URoundedEdgesContainer(
      child: Container(
        height: height,
        color: UColors.primary,
        child: Stack(
          children: [
            /// Circular Container
            Positioned(
              top: -150,
              right: -200,
              child: UCircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderWidth,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),

            /// Circular Container
            Positioned(
              top: 50,
              right: -280,
              child: UCircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderWidth,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),

            /// child
            child,
          ],
        ),
      ),
    );
  }
}
