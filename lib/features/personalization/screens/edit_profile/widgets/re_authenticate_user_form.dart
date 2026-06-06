import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/styles/padding.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/buttons/elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controller/user_controller.dart';

class ReAuthenticateUserForm extends StatelessWidget {
  const ReAuthenticateUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Re-Authenticate',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                /// Email Field
                TextFormField(
                  controller: controller.email,
                  validator: UValidator.validateEmail,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: UTexts.email,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: USizes.spaceBtwItems),

                /// Password Field
                Obx(
                  () => TextFormField(
                    obscureText: controller.isVisible.value,
                    controller: controller.password,
                    validator: UValidator.validatePassword,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () => controller.isVisible.toggle(),
                        icon:
                            controller.isVisible.value
                                ? Icon(Iconsax.eye)
                                : Icon(Iconsax.eye_slash),
                      ),
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: UTexts.password,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: USizes.spaceBtwSections),

                /// Verify Button
                UElevatedButton(
                  onPressed: controller.reAuthenticateUser,
                  child: Text("Verify"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
