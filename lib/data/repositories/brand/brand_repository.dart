import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/helpers/helper_fuction.dart';
import '../../services/cloudinary_services.dart';
import 'package:dio/dio.dart' as dio;

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(
    CloudinaryServices(),
  ); //CloudinaryServices.instance;

  /// [Upload] - Function to upload all brands
  Future<void> uploadBrands(List<BrandModel> brands) async {
    try {
      for (final brand in brands) {
        // Convert asset image to file
        File brandImage = await UHelperFunction.assetToFile(brand.image);

        // Upload image to cloudinary
        dio.Response response = await _cloudinaryServices.upLoadImage(
          brandImage,
          UKeys.brandFolder,
        );

        // Check if upload was successful

        if (response.statusCode == 200) {
          // Get image url
          brand.image = response.data['url'];
        }

        // Upload banner details to firestore

        await _db
            .collection(UKeys.brandCollection)
            .doc(brand.id)
            .set(brand.toJson());

        print('Brand ${brand.name} uploaded successfully');
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw "Somethings went wrong. Please try again later.";
    }
  }

  /// [Fetch] - Function to get all brands
  Future<List<BrandModel>> fetchBrands() async {
    try {
      final query =
          await _db
              .collection(UKeys.brandCollection)
              .where('isFeatured', isEqualTo: true)
              .get();

      if (query.docs.isNotEmpty) {
        List<BrandModel> brands =
            query.docs
                .map((document) => BrandModel.fromSnapshot(document))
                .toList();
        return brands;
      }
      return [];
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw "Somethings went wrong. Please try again later.";
    }
  }
}
