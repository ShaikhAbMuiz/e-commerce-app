import 'package:e_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';

class PrivacyPolicyCheckBox extends StatelessWidget {
  const PrivacyPolicyCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: controller.privacyPolicy.value,
            onChanged: (value) {
              controller.privacyPolicy.value = value!;
            },
          ),
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(text: '${UTexts.iAgreeTo} '),
              TextSpan(
                text: '${UTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: dark ? UColors.white : UColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? UColors.white : UColors.primary,
                ),
              ),
              TextSpan(text: '${UTexts.and} '),
              TextSpan(
                text: '${UTexts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: dark ? UColors.white : UColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? UColors.white : UColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
