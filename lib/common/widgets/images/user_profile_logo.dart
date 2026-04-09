import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UCircularImage(
      image: UImages.profileImage,
      height: 120.0,
      width: 120.0,
      boaderWidth: 5.0,
      padding: 0,
    );
  }
}
