import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UGrideLayout extends StatelessWidget {
  const UGrideLayout({
    super.key,
    required this.itemCount,
    this.mainAxisCount = 288,
    required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: USizes.gridViewSpacing,
        crossAxisSpacing: USizes.gridViewSpacing,
        childAspectRatio: 0.7,
        mainAxisExtent: mainAxisCount,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
