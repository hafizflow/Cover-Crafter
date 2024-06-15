import 'package:cover_page/utils/constants/colors.dart';
import 'package:cover_page/utils/helpers/helper_functions.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/cover_page_list.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/form/field_controller.dart';
import '../../../controllers/form/form_controller.dart';

class CoverPageDropDown extends StatelessWidget {
  const CoverPageDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final form = FormController.instance;
    final fieldController = FieldController.instance;
    bool isDark = CHelperFunctions.isDarkMode(context);

    return Expanded(
      child: DropdownButtonFormField2<String>(
        items: CoverPageList.coverList.map(
          (coverPageType) {
            return DropdownMenuItem<String>(
              value: coverPageType,
              child: SizedBox(
                width: 100,
                child: Text(
                  coverPageType,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ).toList(),
        onChanged: (coverPageType) {
          form.coverPageController.text = coverPageType!;
          fieldController.fieldShow();
        },
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: const InputDecoration(
          label: SizedBox(
            width: 100,
            child: Text(
              ' CoverPage',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(CSizes.borderRadiusMd),
            color: isDark ? Colors.grey.shade900 : CColors.softGrey,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.only(left: 16),
        ),
      ),
    );
  }
}
