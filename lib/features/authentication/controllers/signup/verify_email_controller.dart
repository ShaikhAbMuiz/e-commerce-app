import 'dart:async';

import 'package:e_commerce/utils/constants/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/screen/success_screen.dart';
import '../../../../data/repositories/authentication_repository.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/popups/snackbar_helper.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerifaction();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification Link to the User's Email
  Future<void> sendEmailVerifaction() async {
    try {
      AuthenticationRepository.instance.sendEmailVerification();
      Future.delayed(const Duration(seconds: 3)).then(
        (value) => USnackBarHelpers.successSnackBar(
          title: "Email Sent",
          message: "A verification email has been sent to your email address.",
        ),
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  // Set a timer to check for email verification every 3 seconds and redirect to success screen if verified
  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            title: UTexts.accountCreatedTitle,
            subTitle: UTexts.accountCreatedSubTitle,
            onTap: () => AuthenticationRepository.instance.screenRedirect(),
            image: UImages.successPayment,
          ),
        );
      }
    });
  }

  // Manually Check for Email Verification and Redirect to success screen if verified
  Future<void> checkVerificationStatus() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.emailVerified) {
        Get.off(
          () => SuccessScreen(
            title: UTexts.accountCreatedTitle,
            subTitle: UTexts.accountCreatedSubTitle,
            onTap: () => AuthenticationRepository.instance.screenRedirect(),
            image: UImages.successPayment,
          ),
        );
      }
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
