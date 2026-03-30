import 'package:e_commerce/common/widgets/custom_shapes/circular_container.dart';
import 'package:e_commerce/common/widgets/custom_shapes/rounded_edge_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return URoundedEdgesContainer(
      child: Container(
        height: UDeviceHelpers.getScreenHeight(context) * 0.4,
        color: UColors.primary,
        child: Stack(
          children: [
            /// Circular Container
            Positioned(
              top: -150,
              right: -200,
              child: UCircularContainer(
                height: UDeviceHelpers.getScreenHeight(context) * 0.4,
                width: UDeviceHelpers.getScreenWidth(context) * 0.9,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
                radius: 500,
              ),
            ),

            /// Circular Container
            Positioned(
              top: 50,
              right: -280,
              child: UCircularContainer(
                height: UDeviceHelpers.getScreenHeight(context) * 0.4,
                width: UDeviceHelpers.getScreenWidth(context) * 0.9,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
                radius: 500,
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
