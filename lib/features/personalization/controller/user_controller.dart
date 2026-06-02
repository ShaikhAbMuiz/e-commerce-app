import 'package:e_commerce/utils/popups/snackbar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repositories/authentication_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../authentication/models/user_model.dart';
import '../../authentication/screens/login/login.dart';
import '../screens/edit_profile/widgets/re_authenticate_user_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// Variables
  // User Repository instance
  final _userRepository = Get.put(UserRepository());
  // User Model to store user data
  Rx<UserModel> user = UserModel.empty().obs;
  // Loading state for profile fetching
  RxBool profileLoading = false.obs;

  /// Re-Authenticate Variable
  final email = TextEditingController();
  final password = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();
  RxBool isVisible = false.obs;

  @override
  void onInit() {
    fetchUserDetail();
    super.onInit();
  }

  /// Fuction to save user record
  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      final nameParts = UserModel.nameParts(userCredential.user!.displayName);
      final userName = '${userCredential.user!.displayName}762076';

      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        email: userCredential.user!.email ?? '',
        username: userName,
        firstName: nameParts[0],
        lastName: nameParts.length > 1 ? nameParts[1] : '',
        profilePicture: userCredential.user!.photoURL ?? '',
        phoneNumber: userCredential.user!.phoneNumber ?? '',
      );

      // Save User Record to Firestore
      await _userRepository.saveUserRecord(userModel);
    } catch (e) {
      USnackBarHelpers.errorSnackBar(
        title: 'Data not saved',
        message: 'Failed to save user data. Please try again.',
      );
    }
  }

  /// Fuction to fetch user record
  Future<void> fetchUserDetail() async {
    try {
      profileLoading.value = true;
      UserModel user = await _userRepository.fetchUserDetail();
      this.user.value = user;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// [Popup] - Delete Account Warning Popup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(USizes.md),
      title: "Delete Account",
      middleText: "Are you sure you want to delete your account permanently.",
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: USizes.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text("Cancel"),
      ),
    );
  }

  /// [Function] - Delete User Account
  Future<void> deleteUserAccount() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog("Deleting Account...");

      // Re-authenticate user before deleting account
      final authReopsitory = AuthenticationRepository.instance;
      final provider =
          authReopsitory.currentUser!.providerData
              .map((e) => e.providerId)
              .first;

      /// If Google Sign In, Re-authenticate with Google before deleting account
      if (provider == 'google.com') {
        await authReopsitory.signInWithGoogle();
        await authReopsitory.deleteUserAccount();
        UFullScreenLoader.stopLoading();
        Get.offAll(() => const LoginScreen());

        /// If Email/Password Provider
      } else if (provider == 'password') {
        UFullScreenLoader.stopLoading();
        Get.to(() => const ReAuthenticateUserForm());
      }
    } catch (e) {
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Error',
        message: 'Failed to delete account. Please try again.',
      );
    }
  }

  // [Re-Authenticate User] - Function to re-authenticate user with email and password before deleting account
  Future<void> reAuthenticateUser() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog("Re-Authenticating...");

      // Check Internet Connection
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.errorSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection and try again.',
        );
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // re Authenticate User with Email and Password
      await AuthenticationRepository.instance
          .reAuthenticateUserWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );
      await AuthenticationRepository.instance.deleteUserAccount();

      // Stop Loading
      UFullScreenLoader.stopLoading();

      // Redirect to Login Screen
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
