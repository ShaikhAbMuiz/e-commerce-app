import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/constants/apis.dart';
import '../authentication_repository.dart';
import 'package:dio/dio.dart' as dio;

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Fucntion To Store User Data in Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      // debugging: Print start message to the console for debugging purposes
      // print("========= FIRESTORE SAVE STARTED =========");

      // print("Collection: Users");
      // print("User ID: ${user.id}");
      // print("User Data: ${user.toJson()}");
      await _db
          .collection(UKeys.userCollection)
          .doc(user.id) //
          .set(user.toJson());
      // debugging: Print success message to the console
      // print("========= USER SAVED SUCCESSFULLY =========");
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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

  // CRUD Operations
  // [Read] - Fuction To Fetch User Details based on current user ID
  //[Fetch User Detail] - Fetch user details from Firestore
  Future<UserModel> fetchUserDetail() async {
    try {
      //
      final documnetSnapshot =
          await _db
              .collection(UKeys.userCollection)
              .doc(AuthenticationRepository.instance.currentUser!.uid)
              .get();

      if (documnetSnapshot.exists) {
        UserModel user = UserModel.fromSnapshot(documnetSnapshot);
        return user;
      }

      return UserModel.empty();

      // UserModel user = UserModel.fromSnapshot(documnetSnapshot);
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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

  //
  /// [Update] - Fuction To Update User Details based on current user ID
  Future<void> updateSingleField(Map<String, dynamic> map) async {
    try {
      await _db
          .collection(UKeys.userCollection)
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .update(map);
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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

  /// [Delete User Record] - Fuction To Delete User Details based on current user ID
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection(UKeys.userCollection).doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
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

  /// [Upload Image] - Function to upload user profile picture to Cloudinary
  Future<dio.Response> upLoadImage(File image) async {
    try {
      // API Call to upload image
      String api = UApiUrls.uploadApi(UKeys.cloudName);

      // Create FormData object
      final dio.FormData formData = dio.FormData.fromMap({
        'upload_preset': UKeys.uploadPreset,
        'folder': UKeys.profileFolder,
        'file': await dio.MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });

      // Heat Request to API
      dio.Response response = await dio.Dio().post(api, data: formData);

      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  /// [Delete Image] - Function to delete user profile picture from Cloudinary
  Future<dio.Response> deleteProfilePicture(String publicId) async {
    try {
      String api = UApiUrls.deleteApi(UKeys.cloudName);

      int timeStamp = (DateTime.now().millisecondsSinceEpoch / 1000).round();

      String signatureBase = 'public_id=$publicId&timestamp=$timeStamp${UKeys.apiSecret}';
      String signature = sha1.convert(utf8.encode(signatureBase)).toString();


      final dio.FormData formData = dio.FormData.fromMap({  
        'public_id': publicId,
        'api_key':UKeys.apiKey,
        'timestamp': timeStamp,
        'signature': signature,
        
        });

      dio.Response response = await dio.Dio().post(api, data: formData);

      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  saveUserData(UserModel userModel) {}
}
