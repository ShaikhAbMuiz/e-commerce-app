import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/helpers/helper_fuction.dart';
import '../../services/cloudinary_services.dart';
import 'package:dio/dio.dart' as dio;

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  /// [Upload] - Function to upload list of products to FireStore
  Future<void> uploadProducts(List<ProductModel> products) async {
    try {
      for (ProductModel product in products) {
        /// [Upload] - Function to upload list of products to FireStore
        final Map<String, String> uploadedImageMap =
            {}; // 'asset/image.jpg': 'http://cloudinary.com/image.jpg'

        //? upload thumbnail to cloudinary
        // Convert asset image to file
        File thumbnailFile = await UHelperFunction.assetToFile(
          product.thumbnail,
        );
        //* Upload image to cloudinary
        dio.Response response = await _cloudinaryServices.upLoadImage(
          thumbnailFile,
          UKeys.productsFolder,
        );
        //* Check if upload was successful
        if (response.statusCode == 200) {
          String url = response.data['url'];
          uploadedImageMap[product.thumbnail] = url;
          product.thumbnail = url;
        }

        //? upload images to cloudinary
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrls = [];

          for (String image in product.images!) {
            File imageFile = await UHelperFunction.assetToFile(image);

            // Upload image to cloudinary
            dio.Response response = await _cloudinaryServices.upLoadImage(
              imageFile,
              UKeys.productsFolder,
            );

            // Check if upload was successful
            if (response.statusCode == 200) {
              // Get image url
              imageUrls.add(response.data['url']);
            }
          }

          // upload product Variations image
          // if (product.productVariations != null &&
          //     product.productVariations!.isNotEmpty) {
          //   for (int i = 0; i < product.productVariations!.length; i++) {
          //     uploadedImageMap[product.productVariations![i].image] =
          //         imageUrls[i];
          //   }

          //   for (final variation in product.productVariations!) {
          //     final match = uploadedImageMap.entries.firstWhere(
          //       (entry) => entry.key == variation.image,
          //       orElse: () => const MapEntry('', ''),
          //     );
          //     if (match.key.isNotEmpty) {
          //       variation.image = match.value;
          //     }
          //   }
          // }

          if (product.productVariations != null) {
            for (final variation in product.productVariations!) {
              int index = product.images!.indexWhere(
                (image) => image == variation.image,
              );

              if (index != -1 && index < imageUrls.length) {
                variation.image = imageUrls[index];
              } else {
                print("Image not found for variation: ${variation.image}");
              }
            }
          }

          // Clear images list and assign new image urls
          product.images!.clear();
          product.images!.assignAll(imageUrls);
        }

        // Upload banner details to firestore
        await _db
            .collection(UKeys.productCollection)
            .doc(product.id)
            .set(product.toJson());

        print('Product ${product.id} uploaded successfully.');
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e, stackTrace) {
      print("ERROR => $e");
      print("STACKTRACE => $stackTrace");
      rethrow;
    }
  }

  /// [Fetch] - Function to fetch list of products from FireStore
  Future<List<ProductModel>> fetchFeaturedProducts() async {
    try {
      final query =
          await _db
              .collection(UKeys.productCollection)
              .where('isFeatured', isEqualTo: true)
              .limit(4)
              .get();

      if (query.docs.isNotEmpty) {
        List<ProductModel> products =
            query.docs
                .map((document) => ProductModel.fromSnapshot(document))
                .toList();

        return products;
      }

      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e, stackTrace) {
      print("ERROR => $e");
      print("STACKTRACE => $stackTrace");
      rethrow;
    }
  }
}
