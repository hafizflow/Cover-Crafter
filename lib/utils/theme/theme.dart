import 'package:cover_page/utils/theme/custom_themes/card_theme.dart';
import 'package:cover_page/utils/theme/custom_themes/chip_theme.dart';
import 'package:cover_page/utils/theme/custom_themes/drawer_theme.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/elevation_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class CAppTheme {
  CAppTheme._(); // making the constructor private

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    // scaffoldBackgroundColor: CColors.light,
    scaffoldBackgroundColor: CColors.white,
    primaryColor: CColors.buttonSecondary,
    fontFamily: 'Poppins',
    useMaterial3: true,
    textTheme: CTextTheme.lightTextTheme,
    chipTheme: CChipTheme.lightChipTheme,
    appBarTheme: CAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CTextFieldTheme.lightInputDecorationTheme,
    cardTheme: CCardTheme.lightCardTheme,
    drawerTheme: CDrawerTheme.lightDrawerTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: CColors.dark,
    primaryColor: CColors.buttonPrimary,
    fontFamily: 'Poppins',
    useMaterial3: true,
    textTheme: CTextTheme.darkTextTheme,
    chipTheme: CChipTheme.darkChipTheme,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CTextFieldTheme.darkInputDecorationTheme,
    cardTheme: CCardTheme.darkCardTheme,
    drawerTheme: CDrawerTheme.darkDrawerTheme,
  );
}
