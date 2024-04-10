import 'package:cover_page/controller_binder.dart';
import 'package:cover_page/features/personalization/screens/info_fillup_screen.dart';
import 'package:cover_page/features/personalization/screens/pdf_view_screen.dart';
import 'package:cover_page/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoverPageApp extends StatelessWidget {
  const CoverPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const InfoFillUpScreen(),
    );
  }
}
