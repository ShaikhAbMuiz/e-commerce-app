import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';

class UCircularImage extends StatelessWidget {
  const UCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.padding,
    this.height = 56,
    this.width = 56,
    this.showBoader = false,
    this.boaderColor = UColors.primary,
    this.boaderWidth = 1.0,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double? padding, height, width;
  final bool showBoader;
  final Color boaderColor;
  final double boaderWidth;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding ?? USizes.sm),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? UColors.dark : UColors.light),
        borderRadius: BorderRadius.circular(100),
        border:
            showBoader
                ? Border.all(color: boaderColor, width: boaderWidth)
                : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image(
          image:
              isNetworkImage
                  ? NetworkImage(image)
                  : AssetImage(image) as ImageProvider,

          fit: fit,
        ),
      ),
    );
  }
}
