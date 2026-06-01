import 'package:e_commerce/utils/popups/snackbar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../authentication/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// Variables
  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;

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
    }finally {
      profileLoading.value = false;
    }
  }
}
