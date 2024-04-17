import 'package:cover_page/controller_binder.dart';
import 'package:cover_page/features/personalization/screens/splash_screen.dart';

import 'package:cover_page/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/personalization/controllers/services/app_theme.dart';

class CoverPageApp extends StatelessWidget {
  const CoverPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      themeMode: AppTheme().getThemeMode(),
      home: const SplashScreen(),
    );
  }
}
