import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/services/app_theme.dart';

class ToggleThemeButton extends StatelessWidget {
  const ToggleThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = CHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: IconButton(
        onPressed: () {
          Get.changeThemeMode(CHelperFunctions.isDarkMode(context)
              ? ThemeMode.light
              : ThemeMode.dark);
          AppTheme().saveThemeMode(isDark);
        },
        icon: Icon(
            isDark ? Icons.light_mode_outlined : CupertinoIcons.moon_stars),
      ),
    );
  }
}
