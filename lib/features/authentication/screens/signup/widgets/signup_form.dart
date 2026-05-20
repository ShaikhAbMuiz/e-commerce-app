import 'package:e_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/privacy_policy_check_box.dart';
import 'package:e_commerce/utils/validators/validation.dart';
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
    final controller = SignupController.instance;
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          /// Fist Name And Last Name
          Row(
            children: [
              /// First Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator:
                      (value) =>
                          UValidator.validateEmptyText('First Name', value),
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
                  controller: controller.lastName,
                  validator:
                      (value) =>
                          UValidator.validateEmptyText('Last Name', value),
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
            controller: controller.email,
            validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: UTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => UValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: UTexts.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              obscureText: controller.isPasswordVisible.value,
              controller: controller.password,
              validator: (value) => UValidator.validatePassword(value),
              decoration: InputDecoration(
                labelText: UTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed:
                      () =>
                          controller.isPasswordVisible.value =
                              !controller.isPasswordVisible.value,
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: USizes.spaceBtwInputFields),

          /// Privacy Policy Check Box
          PrivacyPolicyCheckBox(),
          SizedBox(height: USizes.spaceBtwItems),

          /// Create Account Button
          UElevatedButton(
            onPressed: () => controller.registerUser(),
            child: Text(
              UTexts.createAccount,
              style: TextStyle(color: UColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
