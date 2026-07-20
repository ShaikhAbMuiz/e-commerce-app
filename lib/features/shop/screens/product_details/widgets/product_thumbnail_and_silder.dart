import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controllers/product/image_controller.dart';
import '../../../models/product_model.dart';

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    final controller = Get.put(ImageController());
    List<String> images = controller.getAllProductImages(product);
    return Container(
      color: dark ? UColors.darkerGrey : UColors.light,
      child: Stack(
        children: [
          /// [image] --- Main Image OR Thumbnail
          SizedBox(
            width: double.infinity,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(USizes.productImageRadius * 2),
              child: Center(
                child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargeImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                color: UColors.primary,

                                value: downloadProgress.progress,
                              ),
                    ),
                  );
                }),
              ),
            ),
          ),

          ///Image Slider
          Positioned(
            left: USizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80.0,
              child: ListView.separated(
                separatorBuilder:
                    (context, index) =>
                        const SizedBox(width: USizes.spaceBtwItems),
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                shrinkWrap: true,
                itemBuilder:
                    (context, index) => Obx(() {
                      bool isImageSelected =
                          controller.selectedProductImage.value ==
                          images[index];
                      return URoundedImage(
                        border: Border.all(
                          color:
                              isImageSelected
                                  ? UColors.primary
                                  : Colors.transparent,
                        ),
                        padding: EdgeInsets.all(USizes.sm),
                        isNetworkImage: true,
                        onTap:
                            () =>
                                controller.selectedProductImage.value =
                                    images[index],
                        backgroundColor: dark ? UColors.dark : UColors.white,
                        width: 80,
                        imageUrl: images[index],
                      );
                    }),
              ),
            ),
          ),

          /// [AppBar] ---- back Arrow and favorite button
          UAppBar(
            showBackArrow: true,
            actions: [UCircularIcon(icon: Iconsax.heart5, color: UColors.red)],
          ),
        ],
      ),
    );
  }
}
