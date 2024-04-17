import 'package:cover_page/features/personalization/controllers/services/student_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';

class CHelperFunctions {
  // show snackBar
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 1300),
      ),
    );
  }

  // toast message
  static showToastMessage(String message, Color backgroundColor) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
    );
  }

  // flushBar
  // static showFlushBar(
  //     String message, BuildContext context, MaterialColor color) {
  //   showFlushbar(
  //     context: context,
  //     flushbar: Flushbar(
  //       message: message,
  //       duration: const Duration(seconds: 2),
  //       margin: const EdgeInsets.symmetric(horizontal: 24),
  //       borderRadius: BorderRadius.circular(12),
  //       backgroundColor: color,
  //     )..show(context),
  //   );
  // }

  // show alert
  static void showAlert(String title, String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                StudentLocalStorage().eraseAllData();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // navigate to other screen
  static void navigateToOtherScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // isDark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // screen size
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  // screen height
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  // screen width
  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }
}
