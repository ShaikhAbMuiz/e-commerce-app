
import 'package:e_commerce/common/widgets/images/user_profile_logo.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/primary_header_container.dart';

import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UProfilePrimaryHeader extends StatelessWidget {
  const UProfilePrimaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Total Height
        SizedBox(height: USizes.profilePrimaryHeaderHeight + 60),

        ///----------------------------[Primary Header]-------------------------
        UPrimaryHeaderContainer(
          // ignore: sort_child_properties_last
          child: Container(),
          height: USizes.profilePrimaryHeaderHeight,
        ),

        ///----------------------------[User Profile]-------------------------
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Center(
            child: UserProfileLogo(),
          ),
        ),
      ],
    );
  }
}

