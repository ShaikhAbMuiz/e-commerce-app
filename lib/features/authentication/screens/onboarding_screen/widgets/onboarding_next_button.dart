import 'package:e_commerce/common/widgets/buttons/elevated_button.dart';
import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../../../utils/constants/colors.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      left: 0,
      right: 0,
      bottom: USizes.spaceBtwItems,
      child: UElevatedButton(
        onPressed: controller.nextPage,
        child: Obx(
          () => Text(
            controller.currentIndex.value == 2 ? 'Get Started' : 'Next',
            style: TextStyle(color: UColors.white),
          ),
        ),
      ),
    );
  }
}
