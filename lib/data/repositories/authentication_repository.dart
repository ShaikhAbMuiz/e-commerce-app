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
import 'package:google_sign_in/google_sign_in.dart';

import '../../features/authentication/screens/signup/verify_email.dart';
import '../../navigation_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final localStorage = GetStorage();
  // Firebase Authentication instance
  final _auth = FirebaseAuth.instance;

  @override
  /// onReady is called when the controller is fully initialized and ready to be used. It's a good place to perform any initial setup or checks, such as checking if the user is already logged in and redirecting them accordingly.
  void onReady() {
    FlutterNativeSplash.remove();

    screenRedirect();
  }

  /// Function to check if it's the user's first time opening the app and redirect accordingly
  void screenRedirect() {
    final user = _auth.currentUser;
    if (user != null) {
      // Check if email is verified
      if (user.emailVerified) {
        // If Verified, Redirect to navigation menu
        Get.offAll(() => const NavigationMenu());
      } else {
        // if not verified, redirect to verify email screen with user's email
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
    } else {
      // Check if it's the user's first time opening the app
      localStorage.writeIfNull("isFirstTime", true);

      // Redirect to onboarding screen if it's the user's first time, otherwise redirect to login screen
      localStorage.read("isFirstTime") != true
          ? Get.to(
            () => const LoginScreen(),
          ) // If not first time, redirect to login screen
          : Get.to(
            () => const OnboardingScreen(),
          ); // If first time, redirect to onboarding screen
    }
  }

  /// [Authentication] Register User with email & password
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

  /// [EmailAuthentication] Login User with email & password
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  /// [GoogleAuthentication] Login User with Google account
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Show Popup to select Google account
      final GoogleSignInAccount? googleAccount = await GoogleSignIn().signIn();

      // Get The Auth details From Request
      final GoogleSignInAuthentication? googleAuth =
          await googleAccount?.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in using google credentials
      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
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

  // [Email Verification] - Send email verification to the user
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
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

  /// [Logout] -- Sign out the user
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();

      Get.offAll(() => const LoginScreen());
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

  ///
}
