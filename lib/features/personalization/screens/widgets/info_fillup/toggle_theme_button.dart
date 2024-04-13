import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class ToggleThemeButton extends StatelessWidget {
  const ToggleThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: IconButton(
        onPressed: () {
          Get.changeThemeMode(
            CHelperFunctions.isDarkMode(context)
                ? ThemeMode.light
                : ThemeMode.dark,
          );
        },
        icon: Icon(
          CHelperFunctions.isDarkMode(context)
              ? Icons.light_mode_outlined
              : CupertinoIcons.moon_stars,
        ),
      ),
    );
  }
}
