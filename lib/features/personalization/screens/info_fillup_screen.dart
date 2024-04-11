import 'dart:developer';

import 'package:cover_page/common/widgets/info_fillup/section_divider.dart';
import 'package:cover_page/features/personalization/controllers/date_controller.dart';
import 'package:cover_page/features/personalization/controllers/field_controller.dart';
import 'package:cover_page/features/personalization/controllers/form_controller.dart';
import 'package:cover_page/features/personalization/screens/pdf_view_screen.dart';
import 'package:cover_page/features/personalization/screens/widgets/info_fillup/cover_page_dropdown.dart';
import 'package:cover_page/features/personalization/screens/widgets/info_fillup/toggle_theme_button.dart';
import 'package:cover_page/features/personalization/screens/widgets/info_fillup/university_dropdown.dart';
import 'package:cover_page/utils/constants/sizes.dart';
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
    final formController = Get.find<FormController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate Cover Page"),
        actions: const [ToggleThemeButton()],
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
              Row(
                children: [
                  Expanded(
                    child: CTextFormField(
                      label: 'Course Code',
                      prefixIcon: Iconsax.scroll,
                      controller: formController.courseCodeController,
                    ),
                  ),
                  const SizedBox(width: CSizes.spaceBtwInputFields),
                  Expanded(
                    child: CTextFormField(
                      label: 'Course Name',
                      prefixIcon: Iconsax.code,
                      controller: formController.courseNameController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),

              GetBuilder<FieldController>(
                builder: (controller) {
                  if (controller.isAssignment) {
                    log(controller.isAssignment.toString());
                    return const CTextFormField(
                      label: 'Title',
                      prefixIcon: Iconsax.edit,
                    );
                  }
                  log(controller.isAssignment.toString());
                  return Row(
                    children: [
                      Expanded(
                        child: CTextFormField(
                          label: 'Experiment No',
                          prefixIcon: Iconsax.note,
                          controller: formController.experimentNoController,
                        ),
                      ),
                      const SizedBox(width: CSizes.spaceBtwInputFields),
                      Expanded(
                        child: CTextFormField(
                          label: 'Experiment Name',
                          prefixIcon: Iconsax.lamp_charge,
                          controller: formController.experimentNameController,
                        ),
                      ),
                    ],
                  );
                },
              ),

              /// Teacher Name, Department &
              const CSectionDivider(dividerText: 'Faculty Information'),
              CTextFormField(
                label: 'Teacher Name',
                prefixIcon: Iconsax.teacher,
                controller: formController.teacherNameController,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: CTextFormField(
                      label: 'Department',
                      prefixIcon: Iconsax.courthouse,
                      controller: formController.teacherDepartmentController,
                    ),
                  ),
                  const SizedBox(width: CSizes.spaceBtwInputFields),
                  Expanded(
                    child: CTextFormField(
                      label: 'Academic Rank',
                      prefixIcon: Iconsax.activity,
                      controller: formController.teacherAcademicRankController,
                    ),
                  ),
                ],
              ),

              /// Student Name, Department, Section & Semester
              const CSectionDivider(dividerText: 'Student Information'),
              Row(
                children: [
                  Expanded(
                    child: CTextFormField(
                      label: 'Name',
                      prefixIcon: Iconsax.user_edit,
                      controller: formController.studentNameController,
                    ),
                  ),
                  const SizedBox(width: CSizes.spaceBtwInputFields),
                  Expanded(
                    child: CTextFormField(
                      label: 'Student-ID',
                      prefixIcon: Iconsax.personalcard,
                      controller: formController.studentIdController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: CTextFormField(
                      label: 'Section',
                      prefixIcon: Iconsax.layer,
                      controller: formController.studentSectionController,
                    ),
                  ),
                  const SizedBox(width: CSizes.spaceBtwInputFields),
                  Expanded(
                    child: CTextFormField(
                      label: 'Department',
                      prefixIcon: Iconsax.pen_tool,
                      controller: formController.studentDepartmentController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: CTextFormField(
                      label: 'Semester',
                      prefixIcon: Iconsax.keyboard,
                      controller: formController.studentSemesterController,
                    ),
                  ),
                  const SizedBox(width: CSizes.spaceBtwInputFields),
                  Expanded(
                    child: CTextFormField(
                      label: 'Date',
                      prefixIcon: Iconsax.calendar_search,
                      onTap: () => dateController.datePicker(context),
                      controller: dateController.submissionDateController,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwSections),

              /// Generate Pdf Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const PDFViewScreen());
                    log(formController.coverPageController.text);
                  },
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

// GetBuilder<FieldController>(
// builder: (fieldController) {
// return fieldController.isAssignment
// ? const CTextFormField(
// label: 'Title',
// prefixIcon: Iconsax.edit,
// )
//
// /// Experiment No & Name
// :
