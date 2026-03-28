import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/theme/widget_theme/appbar_theme.dart';
import 'package:e_commerce/utils/theme/widget_theme/bottom_sheet_theme.dart';
import 'package:e_commerce/utils/theme/widget_theme/checkbox_theme.dart';
import 'package:e_commerce/utils/theme/widget_theme/chip_theme.dart';
import 'package:e_commerce/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:e_commerce/utils/theme/widget_theme/out_line_theme.dart';
import 'package:e_commerce/utils/theme/widget_theme/text_field_theme.dart';
import 'package:e_commerce/utils/theme/widget_theme/text_theme.dart';
import 'package:flutter/material.dart';

class UAppTheme {
  //private constructor
  UAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    brightness: Brightness.light,
    primaryColor: UColors.primary,
    disabledColor: UColors.grey,
    textTheme: UTextTheme.lightTextTheme,
    chipTheme: UChipTheme.lightChipTheme,
    scaffoldBackgroundColor: UColors.white,
    appBarTheme: UAppBarTheme.lightAppBarTheme,
    checkboxTheme: UCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme:UBottomSheetThemeData.lightBottomSheetTheme,
    elevatedButtonTheme: UElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: UOutLineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: UTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(

    useMaterial3: true,
    fontFamily: 'Nunito',
    brightness: Brightness.dark,
    primaryColor: UColors.primary,
    disabledColor: UColors.grey,
    textTheme: UTextTheme.darkTextTheme,
    chipTheme: UChipTheme.darkChipTheme,
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    appBarTheme: UAppBarTheme.darkAppBarTheme,
    checkboxTheme: UCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: UBottomSheetThemeData.darkBottomSheetTheme,
    elevatedButtonTheme: UElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: UOutLineButtonTheme.darktOutlineButtonTheme,
    inputDecorationTheme: UTextFormFieldTheme.darkInputDecorationTheme,
  );
}