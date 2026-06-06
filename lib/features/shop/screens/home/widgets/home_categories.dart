import 'package:e_commerce/common/widgets/image_text/vertical_image_text.dart';
import 'package:e_commerce/features/shop/screens/sub_category/sub_category.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/shimmer/category_shimmer.dart';
import '../../../../../common/widgets/shimmer/shimmer_effect.dart';
import '../../../controllers/category/category_controller.dart';
import '../../../models/category_model.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Padding(
      padding: const EdgeInsets.only(left: USizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Section Heading
          Text(
            UTexts.popularCategories,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: UColors.white),
          ),
          SizedBox(height: USizes.spaceBtwItems),

          /// Categories ListView
          Obx(() {
            final categories = controller.featuredCategories;

            // [Loading State]
            if (controller.isCategoriesLoading.value) {
              return UCategoryShimmer(itemCount: 6);
            }

            // [Empty]
            if (categories.isEmpty) {
              return const Center(child: Text("No categories found"));
            }

            ///[DataFound]

            return SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder:
                    (context, index) =>
                        const SizedBox(width: USizes.spaceBtwItems),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  CategoryModel category = categories[index];
                  return UVerticalImageText(
                    image: category.image,
                    title: category.name,
                    textColor: UColors.white,
                    onTap: () => Get.to(() => const SubCategoryScreen()),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
