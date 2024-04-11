import 'package:cover_page/features/personalization/controllers/services/university.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/cover_page_list.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/form_controller.dart';

class UniversityDropDown extends StatelessWidget {
  const UniversityDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<FormController>();
    final university = University();

    return Expanded(
      child: DropdownButtonFormField2<String>(
        // value: CoverPageList.uniVarsityList[0]['id'],
        items: CoverPageList.uniVarsityList.map(
          (varsity) {
            return DropdownMenuItem<String>(
              value: varsity['id'],
              child: Row(
                children: [
                  Image.asset(varsity['image'], width: 25),
                  const SizedBox(width: 14),
                  Text(varsity['shortName']),
                ],
              ),
            );
          },
        ).toList(),
        onChanged: (id) {
          formController.universityLogoController.text =
              university.getUniversityLogo(
            id.toString(),
          );

          formController.universityShortNameController.text =
              university.getUniversityShortName(
            id.toString(),
          );

          formController.universityFullNameController.text =
              university.getUniversityFullName(
            id.toString(),
          );
        },
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: const InputDecoration(
          label: Text('  University'),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(CSizes.borderRadiusMd),
          ),
        ),
      ),
    );
  }
}
