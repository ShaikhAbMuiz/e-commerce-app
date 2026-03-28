import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UElevatedButtonTheme {
  UElevatedButtonTheme._();



  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: UColors.white,
      backgroundColor: UColors.primary,
      disabledBackgroundColor: UColors.buttonDisabled,
      disabledForegroundColor: UColors.darkGrey,
      side: const BorderSide(color: UColors.light),
      padding: const EdgeInsets.symmetric(vertical: USizes.buttonheight),
      textStyle: const TextStyle(fontSize: 16, color: UColors.textWhite,fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(USizes.buttonRadius))

    )
  );


  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: UColors.light,
      backgroundColor: UColors.primary,
      disabledBackgroundColor: UColors.darkerGrey,
      disabledForegroundColor: UColors.darkGrey,
      side: const BorderSide(color: UColors.primary),
      padding: const EdgeInsets.symmetric(vertical: USizes.buttonheight),
      textStyle: const TextStyle(fontSize: 16, color: UColors.textWhite,fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(USizes.buttonRadius))

    )
  );
}