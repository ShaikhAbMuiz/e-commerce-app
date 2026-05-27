import 'package:e_commerce/features/authentication/screens/forget_password/forget_password.dart';
import 'package:e_commerce/features/authentication/screens/signup/signup.dart'
    show SignupScreen;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/buttons/elevated_button.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_fuction.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/login/login_controller.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    final dark = UHelperFunction.isDarkMode(context);
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          /// Email And Password
          TextFormField(
            controller: controller.email,
            validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              label: Text(UTexts.email),
            ),
          ),

          SizedBox(height: USizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              // Obscure Text
              obscureText: controller.isPasswordHidden.value,
              // Controller and Validator
              controller: controller.password,
              validator:
                  (value) => UValidator.validateEmptyText('Password', value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                label: Text(UTexts.password),
                // Toggle Password Visibility
                suffixIcon: IconButton(
                  onPressed: () => controller.isPasswordHidden.toggle(),
                  icon: Icon(
                    controller.isPasswordHidden.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
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
                  Obx(
                    () => Checkbox(
                      value: controller.isRememberMe.value,
                      onChanged: (value) => controller.isRememberMe.toggle(),
                    ),
                  ),
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
            onPressed: controller.loginWithEmailAndPassword,
            child: Text(UTexts.signIn, style: TextStyle(color: UColors.white)),
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
      ),
    );
  }
}
