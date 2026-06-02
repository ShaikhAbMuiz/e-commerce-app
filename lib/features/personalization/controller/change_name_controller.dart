import 'package:e_commerce/features/personalization/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../navigation_menu.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/snackbar_helper.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  /// Variables
  final _userRepository = UserRepository.instance;
  final _userController = UserController.instance;
  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final updateUserFromKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initialzeNames();
    super.onInit();
  }

  void initialzeNames() {
    firstName.text = _userController.user.value.firstName;
    lastName.text = _userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      /// Start Loading
      UFullScreenLoader.openLoadingDialog("We are updating your name...");

      // Check Internet Connection
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(
          title: 'No Internet Connection',
          message: 'Please check your internet connection and try again.',
        );
        return;
      }

      // Form Validation
      if (!updateUserFromKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Update User Name From FireStore
      // Create a map of the fields to be updated
      Map<String, dynamic> map = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim(),
      };
      await _userRepository.updateSingleField(map);

      // Aisa bhi kr sakta hai
      //  await _userRepository.updateSingleField({
      //   'firstName': firstName.text.trim(),
      //   'lastName': lastName.text.trim(),
      // });

      // Update User From RX User
      _userController.user.value.firstName = firstName.text.trim();
      _userController.user.value.lastName = lastName.text.trim();

      // Stop Loading
      UFullScreenLoader.stopLoading();

      // redirect to Home Screen
      Get.offAll(() => NavigationMenu());

      // Show Success Message
      USnackBarHelpers.successSnackBar(
        title: 'Congratulations',
        message: 'Your name has been updated successfully.',
      );
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Update Failed',
        message: 'Failed to update name',
      );
    }
  }
}
