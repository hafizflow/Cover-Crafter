import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/formatters/date_formatter.dart';

class DateController extends GetxController {
  static DateController get instance => Get.find();

  TextEditingController submissionDateController = TextEditingController();

  Future<void> datePicker(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      String formattedDate = CFormatter.formatDate(picked);
      submissionDateController.text = formattedDate;
    }
  }

  @override
  void dispose() {
    super.dispose();
    submissionDateController.dispose();
  }
}
