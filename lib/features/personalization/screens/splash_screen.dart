import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cover_page/common/styles/pdf_view/pdf_spacing.dart';
import 'package:cover_page/features/personalization/screens/info_fillup_screen.dart';
import 'package:cover_page/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor:
          CHelperFunctions.isDarkMode(context) ? CColors.dark : Colors.white,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                "assets/animations/splash.json",
              ),
              const SizedBox(height: PDFSpacing.spaceBtwSection),
              Text(
                "Make Cover Page Easily",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          )
        ],
      ),
      splashIconSize: double.infinity,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      splashTransition: SplashTransition.fadeTransition,
      duration: 600,
      nextScreen: const InfoFillUpScreen(),
    );
  }
}
