import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../authentication_repository.dart';

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

  saveUserData(UserModel userModel) {}
}
