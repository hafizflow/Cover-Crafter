import 'dart:developer';

import 'package:cover_page/features/personalization/controllers/field_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/cover_page_list.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/form_controller.dart';

class CoverPageDropDown extends StatelessWidget {
  const CoverPageDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<FormController>();
    final fieldController = Get.find<FieldController>();

    return Expanded(
      child: DropdownButtonFormField2<String>(
        // value: CoverPageList.coverList[0],
        items: CoverPageList.coverList.map(
          (coverPageType) {
            return DropdownMenuItem<String>(
              value: coverPageType,
              child: Text(coverPageType),
            );
          },
        ).toList(),
        onChanged: (coverPageType) {
          formController.coverPageController.text = coverPageType!;
          fieldController.fieldShow();
          log(fieldController.isAssignment.toString());
        },
        // log(val.toString());
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: const InputDecoration(
          label: Text('  CoverPage'),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(CSizes.borderRadiusMd),
          ),
        ),
      ),
    );
  }
}
