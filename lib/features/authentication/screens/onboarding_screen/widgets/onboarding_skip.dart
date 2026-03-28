import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Obx(
      () =>
          controller.currentIndex.value == 2
              ? const SizedBox()
              : Positioned(
                top: UDeviceHelpers.getAppBarHeight(),
                right: 0,
                child: TextButton(
                  onPressed: controller.skipPage,
                  child: Text(
                    "Skip",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
    );
  }
}
