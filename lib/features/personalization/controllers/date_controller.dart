import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/formatters/date_formatter.dart';

class DateController extends GetxController {
  TextEditingController dateTEController = TextEditingController();

  Future<void> datePicker(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      String formattedDate = CFormatter.formatDate(picked);
      dateTEController.text = formattedDate;
    }
  }

  @override
  void dispose() {
    super.dispose();
    dateTEController.dispose();
  }
}
