import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/buttons/elevated_button.dart';
import 'package:e_commerce/features/authentication/screens/forget_password/reset_password.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassWordScreen extends StatelessWidget {
  const ForgetPassWordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ------------------[Header]------------------
              /// Title
              Text(
                UTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              /// Subbtitle
              Text(
                UTexts.forgetEmailSendSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: USizes.spaceBtwSections * 2),

              /// ------------------[Form]------------------
              TextFormField(
                decoration: InputDecoration(
                  labelText: UTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),

              SizedBox(height: USizes.spaceBtwSections),

              UElevatedButton(
                onPressed: () => Get.to(() => ResetPasswordScreen()),
                child: Text(
                  UTexts.submit,
                  style: TextStyle(color: UColors.white),
                ),
              ),

              ///
            ],
          ),
        ),
      ),
    );
  }
}
