import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/buttons/elevated_button.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/forget_password/forget_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final controller = ForgetPasswordController.instance;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => LoginScreen()),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              ///Image
              Image.asset(
                UImages.emailSentImage,
                height: UDeviceHelpers.getScreenWidth(context) * 0.6,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              ///Title
              Text(
                UTexts.forgetEmailSendTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              ///Email
              Text(email, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: USizes.spaceBtwItems),

              ///SubTitle
              Text(
                textAlign: TextAlign.center,
                UTexts.forgetEmailSendSubTitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: USizes.spaceBtwSections),

              ///Done
              UElevatedButton(
                onPressed: () => Get.offAll(() => LoginScreen()),
                child: Text(UTexts.done),
              ),
              SizedBox(height: USizes.spaceBtwSections),

              ///Resend Email
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: controller.resendPaasswordResetEmail,
                  child: Text(UTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
