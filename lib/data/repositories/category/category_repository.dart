import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/category_model.dart';
import '../../../utils/constants/keys.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/helpers/helper_fuction.dart';
import '../../services/cloudinary_services.dart';
import 'package:dio/dio.dart' as dio;

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  /// [UploadCategory] - Function to upload list of categories
  Future<void> uploadCategories(List<CategoryModel> categories) async {
    try {
      for (final category in categories) {
        File image = await UHelperFunction.assetToFile(category.image);
        dio.Response response = await _cloudinaryServices.upLoadImage(
          image,
          UKeys.categoryFolder,
        );
        if (response.statusCode == 200) {
          category.image = response.data['url'];
        }

        await _db
            .collection(UKeys.categoryCollection)
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      // Debugging: Print the error to the console for debugging purposes
      // print("========= FIRESTORE ERROR =========");
      // print(e.toString());

      throw "Somethings went wrong. Please try again later.";
    }
  }

  ///[FetchCategories] - Function to fetch list of categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final query = await _db.collection(UKeys.categoryCollection).get();

      if (query.docs.isNotEmpty) {
        List<CategoryModel> categories =
            query.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
        return categories;
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
