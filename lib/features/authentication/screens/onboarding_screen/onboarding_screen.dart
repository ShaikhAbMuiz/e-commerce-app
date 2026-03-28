import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commerce/features/authentication/screens/onboarding_screen/widgets/onboarding_dot_navgation.dart';
import 'package:e_commerce/features/authentication/screens/onboarding_screen/widgets/onboarding_next_button.dart';
import 'package:e_commerce/features/authentication/screens/onboarding_screen/widgets/onboarding_page.dart';
import 'package:e_commerce/features/authentication/screens/onboarding_screen/widgets/onboarding_skip.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
        child: Stack(
          children: [
            PageView(

              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnboardingPage(
                  animation: UImages.onboardingAnimation1,
                  title: UTexts.onboardingTitle1,
                  subTitle: UTexts.onboardingSubTitle1,
                ),

                OnboardingPage(
                  animation: UImages.onboardingAnimation2,
                  title: UTexts.onboardingTitle2,
                  subTitle: UTexts.onboardingSubTitle2,
                ),

                OnboardingPage(
                  animation: UImages.onboardingAnimation3,
                  title: UTexts.onboardingTitle3,
                  subTitle: UTexts.onboardingSubTitle3,
                ),
              ],
            ),

            /// Indicator
            OnBoardingDotNavgation(),

            /// Bottom Button
            OnBoardingNextButton(),

            /// Skip Button
            OnBoardingSkipButton(),

            ///
          ],
        ),
      ),
    );
  }
}



