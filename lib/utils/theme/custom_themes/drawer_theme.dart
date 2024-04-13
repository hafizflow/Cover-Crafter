import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CDrawerTheme {
  CDrawerTheme._();

  static DrawerThemeData lightDrawerTheme =
      const DrawerThemeData(backgroundColor: CColors.softGrey);

  static DrawerThemeData darkDrawerTheme =
      const DrawerThemeData(backgroundColor: CColors.dark);
}
