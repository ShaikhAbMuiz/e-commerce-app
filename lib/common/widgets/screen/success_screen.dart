import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/buttons/elevated_button.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String title, subTitle, image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              /// Image
              Image.asset(
                image,
                height: UDeviceHelpers.getScreenWidth(context) * 0.6,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              /// Title
              Text(
                textAlign: TextAlign.center,
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              /// Subtitle
              Text(
                textAlign: TextAlign.center,
                subTitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: USizes.spaceBtwSections),

              /// Continue Button
              UElevatedButton(onPressed: onTap, child: Text(UTexts.uContinue)),
            ],
          ),
        ),
      ),
    );
  }
}
