import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CCardTheme {
  CCardTheme._();

  static CardTheme lightCardTheme = const CardTheme(
    color: CColors.softGrey,
    elevation: 5,
    margin: EdgeInsets.symmetric(horizontal: 20.0),
  );

  static CardTheme darkCardTheme = const CardTheme(
    color: CColors.dark,
    // color: CColors.buttonPrimary,
    elevation: 5,
    margin: EdgeInsets.symmetric(horizontal: 20.0),
  );
}
