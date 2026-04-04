import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class URoundedContainer extends StatelessWidget {
  const URoundedContainer({
    super.key,
    this.height,
    this.width,
    this.radius = USizes.cardRadiusLg,
    this.child,
    this.showBoader = false,
    this.borderColor = UColors.borderPrimary,
    this.backgroundColor = UColors.white,
    this.margin,
    this.padding,
  });

  final double? height, width;
  final double radius;
  final Widget? child;
  final bool showBoader;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? margin, padding;

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
        border: showBoader ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
