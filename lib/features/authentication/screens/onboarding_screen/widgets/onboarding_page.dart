
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.animation,
    required this.title,
    required this.subTitle,
  });

  final String animation;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: UDeviceHelpers.getAppBarHeight(),
      ),
      child: Column(
        children: [

          /// Animation
          Lottie.asset(animation),

          /// Title
          Text(title, style: Theme.of(context).textTheme.headlineMedium),


          ///SubTitle
          Text(subTitle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
