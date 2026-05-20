import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final signUpFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  RxBool privacyPolicy = false.obs;

  /// Text Field Controllers
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  /// Function to register the user with email and password
  Future<void> registerUser() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog(
        "We are processing your information.....",
      );

      // Check Internet Connectivity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(
          title: "No Internet Connection",
          message: "Please check your internet connection and try again.",
        );
        return;
      }

      // Check Privacy Policy
      if (!privacyPolicy.value) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(
          title: "Privacy Policy",
          message: "Please accept the privacy policy to continue.",
        );
        return;
      }

      // Form Validation
      if (!signUpFormKey.currentState!.validate()) return;

      // Register the User using Firebase Authentication
      UserCredential userCredential = await AuthenticationRepository.instance
          .registerUser(email.text.trim(), password.text.trim());
      // Debug Print
      // print(
      //   "-------------------------------------Creating user model------------------------------------- ",
      // );

      // Create User Model and save user data to Firestore
      UserModel newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text,
        lastName: lastName.text,
        username: "${firstName.text} ${lastName.text}",
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      // Debug Print
      // print(
      //   "-------------------------------------Save user data to Firestore------------------------------------- ",
      // );
      //Save User Data to Firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Debug Print
      // print(
      //   "-------------------------------------User registration successful------------------------------------- ",
      // );
      // Success Message
      USnackBarHelpers.successSnackBar(
        title: "Registration Successful",
        message:
            "Your account has been created! Verify your email to continue.",
      );

      // Stop Loading
      UFullScreenLoader.stopLoading();

      // Redirect to verify email screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      //Debug Print
      // print(
      //   "-------------------------------------User registration failed------------------------------------- ",
      // );
      UFullScreenLoader.stopLoading();

      USnackBarHelpers.errorSnackBar(
        title: "Registration Failed",
        message: e.toString(),
      );
    }
  }
}
