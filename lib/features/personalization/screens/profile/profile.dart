import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_primary_header.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/setting_menu_tile.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/user_profile_tile.dart';

import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///----------------------------[Primary Header]-------------------------
            UProfilePrimaryHeader(),

            /// ----------------------------[User Profile Details]-------------------------
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  ///----------------------------[User Details]-------------------------
                  UserProfileTile(),
                  SizedBox(height: USizes.spaceBtwItems),

                  /// ----------------------------[Account Settings]-------------------------
                  USectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),

                  ///----------------------------[Setting Menu]-------------------------
                  SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Address",
                    subtitle: "Set Shopping delivery address",
                  ),
                  SettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subtitle: "Add remove products and move to checkout",
                  ),
                  SettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subtitle: "In-progress and Completed orders",
                  ),
                  SizedBox(height: USizes.spaceBtwSections),

                  /// ----------------------------[Logout]-------------------------
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("Logout"),
                    ),
                  ),

                  SizedBox(height: USizes.spaceBtwSections),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
