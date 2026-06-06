import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/banners_model.dart';
import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/cloudinary_services.dart';
import 'package:dio/dio.dart' as dio;

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(
    CloudinaryServices(),
  ); //CloudinaryServices.instance;

  /// [Upload Banners] - Function to upload list of banners
  Future<void> uploadBanners(List<BannerModel> banners) async {
    try {
      for (final banner in banners) {
        // Convert asset image to file
        File image = await UHelperFunction.assetToFile(banner.imageUrl);
        // Upload image to cloudinary
        dio.Response response = await _cloudinaryServices.upLoadImage(
          image,
          UKeys.bannerFolder,
        );

        // Check if upload was successful

        if (response.statusCode == 200) {
          // Get image url
          banner.imageUrl = response.data['url'];
        }

        // Upload banner details to firestore
        await _db.collection(UKeys.bannerCollection).doc().set(banner.toJson());
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

  Future<List<BannerModel>> fetchActiveBanners() async {
    try {
      final query =
          await _db
              .collection(UKeys.bannerCollection)
              .where('active', isEqualTo: true)
              .get();
      if (query.docs.isNotEmpty) {
        List<BannerModel> banners =
            query.docs
                .map((document) => BannerModel.fromSnapshot(document))
                .toList();
        return banners;
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
