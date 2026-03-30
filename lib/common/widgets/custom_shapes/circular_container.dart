import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UCircularContainer extends StatelessWidget {
  const UCircularContainer({
    super.key,
     this.height = 400,
     this.width = 400,
     this.radius = 400,
     this.backgroundColor = UColors.white,
     this.padding,
     this.margin,
  });

  final double height, width, radius;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );
  }
}

// UDeviceHelpers.getScreenHeight(context) * 0.4
// UDeviceHelpers.getScreenWidth(context) * 0.9