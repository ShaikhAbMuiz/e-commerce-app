import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/authentication/screens/onboarding_screen/onboarding_screen.dart';
import 'package:e_commerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  
  static AuthenticationRepository get instance => Get.find();
  final localStorage = GetStorage();
  // Firebase Authentication instance 
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();

    screenRedirect();
  }

  /// Function to check if it's the user's first time opening the app and redirect accordingly
  void screenRedirect() {
    localStorage.writeIfNull("isFirstTime", true);

    localStorage.read("isFirstTime") != true
        ? Get.to(() => const LoginScreen())
        : Get.to(() => const OnboardingScreen());
  }

  /// [Authentication] with email & password 
  Future<UserCredential> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw UFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw UFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw UPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again later.";
    }
  }
}
