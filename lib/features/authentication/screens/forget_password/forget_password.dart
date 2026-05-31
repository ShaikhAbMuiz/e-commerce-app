import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/buttons/elevated_button.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/validators/validation.dart';
import '../../controllers/forget_password/forget_password_controller.dart';

class ForgetPassWordScreen extends StatelessWidget {
  const ForgetPassWordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
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
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  validator: (value) => UValidator.validateEmail(value),
                  controller: controller.email,
                  decoration: InputDecoration(
                    labelText: UTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
              ),

              SizedBox(height: USizes.spaceBtwSections),

              UElevatedButton(
                onPressed: controller.sendPaasswordResetEmail,
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
