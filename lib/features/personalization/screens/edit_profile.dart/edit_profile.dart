import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';

import 'package:e_commerce/features/personalization/screens/edit_profile.dart/widgets/user_profile_with_edit_icon.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              /// User Profile With Edit Icon
              UProfileImageWithEditIcon(),
              SizedBox(height: USizes.spaceBtwSections),

              /// Divider
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              /// Account Sections Heading
              USectionHeading(
                title: "Account Settings",
                showActionButton: false,
              ),

              /// Account Details
              UserDetailRow(title: "Name", value: "John Doe", onTap: () {}),
              UserDetailRow(title: "Username", value: "John Doe", onTap: () {}),
              SizedBox(height: USizes.spaceBtwItems),

              /// Divider
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              /// Profile Sections Heading
              USectionHeading(
                title: "Profile Settings",
                showActionButton: false,
              ),

              /// Profile Settings
              UserDetailRow(
                title: "User ID",
                value: "762076",
                onTap: () {},

                icon: Iconsax.copy,
              ),

              UserDetailRow(
                title: "Email",
                value: "abdulmuiz9922@gmail",
                onTap: () {},
              ),
              UserDetailRow(title: "Phone", value: "1234567890", onTap: () {}),
              UserDetailRow(title: "Gender", value: "Male", onTap: () {}),

              /// Divider
              SizedBox(height: USizes.spaceBtwItems),
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              /// Close Account Text Button
              TextButton(
                onPressed: () {},
                child: Text(
                  "Close Account",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.apply(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetailRow extends StatelessWidget {
  const UserDetailRow({
    super.key,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_right_34,
    required this.onTap,
  });
  final String title, value;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: USizes.spaceBtwItems / 1.5,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: Icon(icon, size: USizes.iconXs)),
          ],
        ),
      ),
    );
  }
}

