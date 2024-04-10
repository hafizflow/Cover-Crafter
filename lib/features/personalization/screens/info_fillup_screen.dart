import 'dart:developer';

import 'package:cover_page/common/widgets/info_fillup/section_divider.dart';
import 'package:cover_page/features/personalization/controllers/date_controller.dart';
import 'package:cover_page/features/personalization/screens/widgets/cover_page_dropdown.dart';
import 'package:cover_page/features/personalization/screens/widgets/university_dropdown.dart';
import 'package:cover_page/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/info_fillup/text_form_field.dart';

class InfoFillUpScreen extends StatelessWidget {
  const InfoFillUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('Widget rebuild');
    final dateController = Get.find<DateController>();

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
              const Row(
                children: [
                  CoverPageDropDown(),
                  SizedBox(width: CSizes.spaceBtwInputFields),
                  UniversityDropDown(),
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
                      onTap: () => dateController.datePicker(context),
                      controller: dateController.dateTEController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwSections),

              /// Generate Pdf Button
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
