import 'package:e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/privacy_policy_check_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/buttons/elevated_button.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
// import '../../../../../utils/helpers/helper_fuction.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = UHelperFunction.isDarkMode(context);
    return Column(
      children: [
        /// Fist Name And Last Name
        Row(
          children: [
            /// First Name
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: UTexts.fistName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
            SizedBox(width: USizes.spaceBtwInputFields),

            /// Last Name
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: UTexts.lastName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwInputFields),

        /// Email
        TextFormField(
          decoration: InputDecoration(
            labelText: UTexts.email,
            prefixIcon: Icon(Iconsax.direct_right),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),

        /// Phone Number
        TextFormField(
          decoration: InputDecoration(
            labelText: UTexts.phoneNumber,
            prefixIcon: Icon(Iconsax.call),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),

        /// Password
        TextFormField(
          decoration: InputDecoration(
            labelText: UTexts.password,
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields),

        /// Privacy Policy Check Box
        PrivacyPolicyCheckBox(),
        SizedBox(height: USizes.spaceBtwItems),

        /// Create Account Button
        UElevatedButton(
          onPressed: () => Get.to(() => VerifyEmailScreen()),
          child: Text(
            UTexts.createAccount,
            style: TextStyle(color: UColors.white),
          ),
        ),
      ],
    );
  }
}
