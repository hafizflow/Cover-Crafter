import 'dart:developer';

import 'package:cover_page/common/widgets/info_fillup/section_divider.dart';
import 'package:cover_page/features/personalization/controllers/date_controller.dart';
import 'package:cover_page/utils/constants/cover_page_list.dart';
import 'package:cover_page/utils/constants/sizes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/info_fillup/text_form_field.dart';

class InfoFillUpScreen extends StatelessWidget {
  const InfoFillUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DateController>();
    log('Widget rebuild');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate Cover Page"),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: CSizes.defaultSpace),
            onPressed: () {
              Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
            },
            icon: Icon(
              Get.isDarkMode
                  ? Icons.light_mode_outlined
                  : CupertinoIcons.moon_stars,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: CSizes.defaultSpace,
            vertical: CSizes.verticalSpace,
          ),
          child: Column(
            children: [
              /// CoverPage & University
              Row(
                children: [
                  Expanded(
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
                      onChanged: (coverPageType) {},
                      // log(val.toString());
                      style: Theme.of(context).textTheme.bodyLarge,
                      decoration: const InputDecoration(
                        label: Text('  CoverPage'),
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(CSizes.borderRadiusMd),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: CSizes.spaceBtwInputFields),
                  Expanded(
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
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),

              /// Course Code & Name
              const Row(
                children: [
                  Expanded(
                    child: CTextFormField(
                      label: 'Course Code',
                      prefixIcon: Iconsax.code,
                    ),
                  ),
                  SizedBox(width: CSizes.spaceBtwInputFields),
                  Expanded(
                    child: CTextFormField(
                      label: 'Course Name',
                      prefixIcon: Iconsax.edit,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),

              /// Experiment No & Name
              const Row(
                children: [
                  Expanded(
                    child: CTextFormField(
                      label: 'Experiment No',
                      prefixIcon: Iconsax.note,
                    ),
                  ),
                  SizedBox(width: CSizes.spaceBtwInputFields),
                  Expanded(
                    child: CTextFormField(
                      label: 'Experiment Name',
                      prefixIcon: Iconsax.lamp_charge,
                    ),
                  ),
                ],
              ),

              /// Teacher Name, Department &
              const CSectionDivider(dividerText: 'Faculty Information'),
              const CTextFormField(
                label: 'Teacher Name',
                prefixIcon: Iconsax.teacher,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              const Row(
                children: [
                  Expanded(
                    child: CTextFormField(
                      label: 'Teacher Department',
                      prefixIcon: Iconsax.courthouse,
                    ),
                  ),
                  SizedBox(width: CSizes.spaceBtwInputFields),
                  Expanded(
                    child: CTextFormField(
                      label: 'Teacher Rank',
                      prefixIcon: Iconsax.activity,
                    ),
                  ),
                ],
              ),

              /// Student Name, Department, Section & Semester
              const CSectionDivider(dividerText: 'Student Information'),
              const Row(
                children: [
                  Expanded(
                    child: CTextFormField(
                      label: 'Name',
                      prefixIcon: Iconsax.user_edit,
                    ),
                  ),
                  SizedBox(width: CSizes.spaceBtwInputFields),
                  Expanded(
                    child: CTextFormField(
                      label: 'Student-ID',
                      prefixIcon: Iconsax.personalcard,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              const Row(
                children: [
                  Expanded(
                    child: CTextFormField(
                      label: 'Section',
                      prefixIcon: Iconsax.layer,
                    ),
                  ),
                  SizedBox(width: CSizes.spaceBtwInputFields),
                  Expanded(
                    child: CTextFormField(
                      label: 'Department',
                      prefixIcon: Iconsax.pen_tool,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              Row(
                children: [
                  const Expanded(
                    child: CTextFormField(
                      label: 'Semester',
                      prefixIcon: Iconsax.keyboard,
                    ),
                  ),
                  const SizedBox(width: CSizes.spaceBtwInputFields),
                  Expanded(
                    child: CTextFormField(
                      label: 'Date',
                      prefixIcon: Iconsax.calendar_search,
                      onTap: () => controller.datePicker(context),
                      controller: controller.dateTEController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Generate PDF'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
