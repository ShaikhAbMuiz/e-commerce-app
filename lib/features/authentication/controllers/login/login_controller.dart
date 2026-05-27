import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/snackbar_helper.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool isPasswordHidden = false.obs;
  RxBool isRememberMe = false.obs;
  final loginFormKey = GlobalKey<FormState>();

  final localStorage = GetStorage();

  Future<void> loginWithEmailAndPassword() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Logging in...');

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(
          title: 'No Internet Connection',
          message: 'Please check your internet connection and try again.',
        );
        return;
      }

      // Validate the form
      if (!loginFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Save Data to Local Storage if Remember Me is checked
      if (isRememberMe.value) {
        localStorage.write('Remember_email', email.text.trim());
        localStorage.write('Remember_password', password.text.trim());
      }

      // Login User with Email and Password
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );
      print("Login Successful");

      // Stop Loading
      UFullScreenLoader.stopLoading();

      // Redirect handled by Authentication Repository's onReady method
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Handle login error
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    }
  }
}
