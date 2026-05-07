import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  final storage = GetStorage();

  /// Variables
  final pageController = PageController();
  RxInt currentIndex = 0.obs;

  /// Upadate Current Index when page scroll
  void updatePageIndicator(index) {
    currentIndex.value = index;
  }

  /// Jump to specific dot slected page
  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// update current index and jump to the next page
  void nextPage() {
    if (currentIndex.value == 2) {
      storage.write("isFirstTime", false);
      Get.offAll(() => const LoginScreen());
      return;
    }
    currentIndex.value = currentIndex.value + 1;
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  /// Update current index and jump to the last page
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
