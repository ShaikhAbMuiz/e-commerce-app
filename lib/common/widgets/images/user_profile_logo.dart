import 'package:e_commerce/common/widgets/images/circular_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/personalization/controller/user_controller.dart';
import '../../../utils/constants/images.dart';
import '../shimmer/shimmer_effect.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Obx(() {
      bool isProfileAvailable = controller.user.value.profilePicture.isNotEmpty;

      /// [Loading State]
      if (controller.isProfileUploading.value) {
        return UShimmerEffect(width: 120.0, height: 120.0, radius: 120.0);
      }
      return UCircularImage(
        isNetworkImage: isProfileAvailable ? true : false,
        image:
            isProfileAvailable
                ? controller.user.value.profilePicture
                : UImages.profileImage,
        height: 120.0,
        width: 120.0,
        boaderWidth: 5.0,
        padding: 0,
      );
    });
  }
}
