import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text("Sports", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              // Sub Category
              USectionHeading(title: "Sport Shoes", onPressed: () {}),
              SizedBox(height: USizes.spaceBtwItems / 2),

              SizedBox(
                height: 100,
                child: ListView.separated(
                  separatorBuilder:
                      (context, index) =>
                          const SizedBox(width: USizes.spaceBtwItems),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return UProductCardHorizontal();
                  },
                ),
              ),

              // Sub Category
              USectionHeading(title: "Sport Shoes", onPressed: () {}),
              SizedBox(height: USizes.spaceBtwItems / 2),

              SizedBox(
                height: 100,
                child: ListView.separated(
                  separatorBuilder:
                      (context, index) =>
                          const SizedBox(width: USizes.spaceBtwItems),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return UProductCardHorizontal();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
