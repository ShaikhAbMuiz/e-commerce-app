import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/user_profile_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controller/user_controller.dart';

class UProfileImageWithEditIcon extends StatelessWidget {
  const UProfileImageWithEditIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Stack(
      children: [
        /// User Profile Logo
        Center(child: UserProfileLogo()),

        /// Edit Icon
        Obx(() {
          if (controller.isProfileUploading.value) {
            return SizedBox();
          }
          return Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: Center(
              child: UCircularIcon(
                icon: Iconsax.edit,
                onPressed: controller.updateUserProfilePicture,
              ),
            ),
          );
        }),
      ],
    );
  }
}
