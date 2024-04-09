import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CDeviceUtils {
  // hide key board
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // StatusBar color changer
  static Future<void> statusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  // Is device in landScape or not
  static bool isLandScapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  // Is device in portrait or not
  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  // set full screen
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  // get screen height
  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  // get screen width
  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  // get pixel ratio
  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  // get statusBar height
  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  // get bottomNavBar height
  static double getBottomNavBarHeight() {
    return kBottomNavigationBarHeight;
  }

  // get appbar height
  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  // get keyBoard height
  static double getKeyBoardHeight() {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  // is keyBoard visible
  static Future<bool> isKeyBoardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  // which physical device
  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  // vibrate
  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  // set orientation
  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  // hide status bar
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  // show status bar
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  // has internet connection
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  // is ios
  static bool isIOS() {
    return Platform.isIOS;
  }

  // is android
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  // launch url
  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
