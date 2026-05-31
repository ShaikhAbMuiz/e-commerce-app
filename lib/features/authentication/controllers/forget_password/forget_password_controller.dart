import 'package:e_commerce/features/authentication/screens/forget_password/reset_password.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/authentication_repository.dart';
import '../../../../utils/helpers/network_manager.dart';


class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Email To Forget Password
  Future<void> sendPaasswordResetEmail() async {
    try {
      //Start Loading
      UFullScreenLoader.openLoadingDialog('Processing your request...');

      // Check Internet Connection
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return;
      }
      // Validate Form
      if (!forgetPasswordFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Send Password Reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      // Stop Loading
      UFullScreenLoader.stopLoading();

      // Show Success Message
      USnackBarHelpers.successSnackBar(
        title: "Password Reset Email Sent",
        message: "Please check your email to reset your password.",
      );

      // Redirect to Login Screen
      Get.offAll(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Stop Loading
      UFullScreenLoader.stopLoading();

      // Show Error Message
      USnackBarHelpers.errorSnackBar(
        title: "Failed Forget Password",
        message: e.toString(),
      );
    }
  }
 
 /// Resend Password Reset Email
  Future<void> resendPaasswordResetEmail() async {
    try {
      //Start Loading
      UFullScreenLoader.openLoadingDialog('Processing your request...');

      // Check Internet Connection
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: "No Internet Connection");
        return;
      }

      // Send Password Reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      // Stop Loading
      UFullScreenLoader.stopLoading();

      // Show Success Message
      USnackBarHelpers.successSnackBar(
        title: "Password Reset Email Sent",
        message: "Please check your email to reset your password.",
      );
    } catch (e) {
      // Stop Loading
      UFullScreenLoader.stopLoading();

      // Show Error Message
      USnackBarHelpers.errorSnackBar(
        title: "Failed Forget Password",
        message: e.toString(),
      );
    }
  }
}
