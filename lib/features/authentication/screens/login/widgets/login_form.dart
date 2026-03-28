import 'package:e_commerce/features/authentication/screens/forget_password/forget_password.dart';
import 'package:e_commerce/features/authentication/screens/signup/signup.dart'
    show SignupScreen;
import 'package:e_commerce/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/buttons/elevated_button.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_fuction.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Column(
      children: [
        /// Email And Password
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            label: Text(UTexts.email),
          ),
        ),

        SizedBox(height: USizes.spaceBtwInputFields),

        /// Password
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            label: Text(UTexts.password),
            suffixIcon: Icon(Iconsax.eye),
          ),
        ),
        SizedBox(height: USizes.spaceBtwInputFields / 2),

        /// Remember Me and Forget Password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Remember Me
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text(UTexts.rememberMe),
              ],
            ),

            /// Forget Password
            TextButton(
              onPressed: () => Get.to(() => const ForgetPassWordScreen()),
              child: Text(
                UTexts.forgetPassword,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
        SizedBox(height: USizes.spaceBtwSections),

        /// Sign In
        UElevatedButton(
          child: Text(UTexts.signIn, style: TextStyle(color: UColors.white)),
          onPressed: () => Get.to(() => NavigationMenu()),
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        /// Create Account
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            child: Text(
              UTexts.createAccount,
              style: TextStyle(color: dark ? UColors.white : UColors.black),
            ),
            onPressed: () => Get.to(() => const SignupScreen()),
          ),
        ),
      ],
    );
  }
}
