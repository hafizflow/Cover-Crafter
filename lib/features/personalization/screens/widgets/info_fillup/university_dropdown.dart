import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/cover_page_list.dart';
import '../../../../../utils/constants/sizes.dart';

class UniversityDropDown extends StatelessWidget {
  const UniversityDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField2<String>(
        // value: CoverPageList.coverList[0],
        items: CoverPageList.uniVarsityList.map(
              (varsity) {
            return DropdownMenuItem<String>(
              value: varsity['name'],
              child: Row(
                children: [
                  Image.asset(varsity['image'], width: 25),
                  const SizedBox(width: 14),
                  Text(varsity['name']),
                ],
              ),
            );
          },
        ).toList(),
        onChanged: (varsity) {},
        // log(val.toString());
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: const InputDecoration(
          label: Text('  University'),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(CSizes.borderRadiusMd),
          ),
        ),
      ),
    );
  }
}
