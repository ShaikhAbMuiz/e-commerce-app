import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/styles/padding.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/buttons/elevated_button.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/validators/validation.dart';
import '../../controller/change_name_controller.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      /// --------[AppBar]--------
      appBar: UAppBar(
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              /// ------------------[Header]------------------
              /// Heading
              Text(
                UTexts.profileScreenChangeNameTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: USizes.spaceBtwSections),

              /// ------------------[Form]------------------
              /// First Name
              Form(
                key: controller.updateUserFromKey,
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
              SizedBox(height: USizes.spaceBtwItems),

              /// Last Name
              Form(
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

              SizedBox(height: USizes.spaceBtwSections),

              /// Save Button
              UElevatedButton(
                onPressed: controller.updateUserName,
                child: Text(
                  UTexts.saveButton,
                  style: TextStyle(color: UColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
