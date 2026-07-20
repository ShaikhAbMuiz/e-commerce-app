import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class ImageController extends GetxController {
  static ImageController instance = Get.find();

  /// Variables
  RxString selectedProductImage = "".obs;

  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};

    // Load Thumbail image
    images.add(product.thumbnail);

    // Assign Thumbail as Selected Image
    selectedProductImage.value = product.thumbnail;

    // Load all Images of product
    if (product.images != null && product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }

    // Load all images from the product variations
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      List<String> variationsImages =
          product.productVariations!
              .map((variation) => variation.image)
              .toList();

      images.addAll(variationsImages);
    }

    return images.toList();
  }

  void showEnlargeImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          children: [
            Padding(
              /// Image
              padding: EdgeInsets.symmetric(
                vertical: USizes.defaultSpace * 2,
                horizontal: USizes.defaultSpace,
              ),
              child: CachedNetworkImage(imageUrl: image),
            ),

            SizedBox(height: USizes.spaceBtwSections),

            /// Close Button
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: Text("Close"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
