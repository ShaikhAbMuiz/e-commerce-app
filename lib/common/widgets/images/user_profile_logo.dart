import 'package:e_commerce/common/widgets/images/circular_image.dart';

import 'package:flutter/material.dart';

import '../../../features/personalization/controller/user_controller.dart';
import '../../../utils/constants/images.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    bool isProfileAvailable = controller.user.value.profilePicture.isNotEmpty;
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
  }
}
