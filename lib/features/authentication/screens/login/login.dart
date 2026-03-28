import 'package:e_commerce/common/styles/padding.dart';

import 'package:e_commerce/common/widgets/login_signup.dart/form_divider.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_header.dart';

import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';

import 'package:flutter/material.dart';

import '../../../../common/widgets/buttons/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// ---------------------- [Header] ----------------
              /// Title And Subbtitle
              ULoginHeader(),
              SizedBox(height: USizes.spaceBtwSections),

              /// -------------------- [Form] ------------------
              /// Email And Password
              ULoginForm(),
              SizedBox(height: USizes.spaceBtwSections),

              /// --------------------- [Divider] ----------------
              UFormDivider(title: UTexts.orSignInWith),
              SizedBox(height: USizes.spaceBtwSections),

              /// --------------------- [Footer] ----------------
              /// Social Buttons
              USocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
