import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/buttons/elevated_button.dart';
import 'package:e_commerce/common/widgets/screen/success_screen.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                UTexts.verifyEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              ///Email
              Text(
                "unknownpro@gmail.com",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              ///SubTitle
              Text(
                textAlign: TextAlign.center,
                UTexts.verifyEmailSubTitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: USizes.spaceBtwSections),

              ///Continue
              UElevatedButton(
                onPressed:
                    () => Get.to(
                      () => SuccessScreen(
                        image: UImages.accountCreatedImage,
                        title: UTexts.accountCreatedTitle,
                        subTitle: UTexts.accountCreatedSubTitle,
                        onTap: () {},
                      ),
                    ),
                child: Text(UTexts.uContinue),
              ),
              
              SizedBox(height: USizes.spaceBtwSections),

              ///Resend Email
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
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
