import 'package:cover_page/common/widgets/info_fillup/section_divider.dart';
import 'package:cover_page/features/personalization/controllers/form/date_controller.dart';
import 'package:cover_page/features/personalization/controllers/services/show_Snackbar.dart';
import 'package:cover_page/features/personalization/screens/pdf_view_screen.dart';
import 'package:cover_page/features/personalization/screens/widgets/info_fillup/app_drawer.dart';
import 'package:cover_page/features/personalization/screens/widgets/info_fillup/cover_page_dropdown.dart';
import 'package:cover_page/features/personalization/screens/widgets/info_fillup/toggle_theme_button.dart';
import 'package:cover_page/features/personalization/screens/widgets/info_fillup/university_dropdown.dart';
import 'package:cover_page/utils/constants/sizes.dart';
import 'package:cover_page/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/widgets/info_fillup/text_form_field.dart';
import '../controllers/form/field_controller.dart';
import '../controllers/form/form_controller.dart';
import '../controllers/services/student_local_storage.dart';

class InfoFillUpScreen extends StatefulWidget {
  const InfoFillUpScreen({super.key});

  @override
  State<InfoFillUpScreen> createState() => _InfoFillUpScreenState();
}

class _InfoFillUpScreenState extends State<InfoFillUpScreen> {
  final date = DateController.instance;
  final form = FormController.instance;
  final localStorage = StudentLocalStorage();

  @override
  void initState() {
    super.initState();
    localStorage.getStudentInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Generate Cover Page"),
          actions: const [ToggleThemeButton()],
        ),
        drawer: const AppDrawer(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              left: CSizes.defaultSpace,
              right: CSizes.defaultSpace,
              top: CSizes.verticalSpace,
              bottom: 32,
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
                        controller: form.courseCodeController,
                        maxLength: 10,
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFields),
                    Expanded(
                      child: CTextFormField(
                        label: 'Course Name',
                        prefixIcon: Iconsax.code,
                        controller: form.courseNameController,
                        maxLength: 50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),

                GetBuilder<FieldController>(
                  builder: (controller) {
                    if (controller.isAssignment) {
                      return CTextFormField(
                        label: 'Title',
                        prefixIcon: Iconsax.edit,
                        controller: form.titleController,
                        maxLength: 100,
                      );
                    }
                    return Row(
                      children: [
                        Expanded(
                          child: CTextFormField(
                            label: 'Experiment No',
                            prefixIcon: Iconsax.note,
                            controller: form.experimentNoController,
                            maxLength: 6,
                            keyBoardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: CSizes.spaceBtwInputFields),
                        Expanded(
                          child: CTextFormField(
                            label: 'Experiment Name',
                            prefixIcon: Iconsax.lamp_charge,
                            controller: form.experimentNameController,
                            maxLength: 100,
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
                  controller: form.teacherNameController,
                  maxLength: 40,
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: CTextFormField(
                        label: 'Department',
                        prefixIcon: Iconsax.courthouse,
                        controller: form.teacherDepartmentController,
                        maxLength: 50,
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFields),
                    Expanded(
                      child: CTextFormField(
                        label: 'Designation',
                        prefixIcon: Iconsax.activity,
                        controller: form.teacherDesignationController,
                        maxLength: 40,
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
                        controller: form.studentNameController,
                        maxLength: 50,
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFields),
                    Expanded(
                      child: CTextFormField(
                        label: 'Student-ID',
                        prefixIcon: Iconsax.personalcard,
                        controller: form.studentIdController,
                        maxLength: 30,
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
                        controller: form.studentSectionController,
                        maxLength: 20,
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFields),
                    Expanded(
                      child: CTextFormField(
                        label: 'Department',
                        prefixIcon: Iconsax.pen_tool,
                        controller: form.studentDeptController,
                        maxLength: 50,
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
                        controller: form.studentSemesterController,
                        maxLength: 20,
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwInputFields),
                    Expanded(
                      child: CTextFormField(
                        label: 'Date',
                        prefixIcon: Iconsax.calendar_search,
                        onTap: () => date.datePicker(context),
                        controller: date.submissionDateController,
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
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const PDFViewScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        ),
                      );

                      localStorage.setStudentInfo();
                      ShowShowSnackBar().getSnackBar()
                          ? CHelperFunctions.showToastMessage(
                              "Successfully PDF crated",
                              Colors.green,
                            )
                          : CHelperFunctions.showToastMessage(
                              "Please enter all the information",
                              Colors.red,
                            );
                    },
                    child: const Text('Generate PDF'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
