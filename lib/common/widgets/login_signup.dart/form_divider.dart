import 'package:e_commerce/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';


class UFormDivider extends StatelessWidget {
  const UFormDivider({super.key, required this.title});


  final String title;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunction.isDarkMode(context);
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 60,
            endIndent: 5,
            thickness: 0.8,
            color: dark ? UColors.darkGrey : UColors.grey,
          ),
        ),
        Text(title, style: Theme.of(context).textTheme.labelSmall),
        Expanded(
          child: Divider(
            indent: 5,
            endIndent: 60,
            thickness: 0.8,
            color: dark ? UColors.darkGrey : UColors.grey,
          ),
        ),
      ],
    );
  }
}
