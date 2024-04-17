import 'package:cover_page/features/personalization/controllers/form/date_controller.dart';
import 'package:cover_page/features/personalization/controllers/form/form_controller.dart';

class ShowShowSnackBar {
  final form = FormController.instance;
  final date = DateController.instance;

  bool getSnackBar() {
    if (form.studentUniversityIdController.text.isEmpty ||
        form.coverPageController.text.isEmpty ||
        form.courseCodeController.text.isEmpty ||
        form.courseNameController.text.isEmpty ||
        form.teacherNameController.text.isEmpty ||
        form.teacherDepartmentController.text.isEmpty ||
        form.teacherDesignationController.text.isEmpty ||
        form.studentNameController.text.isEmpty ||
        form.studentIdController.text.isEmpty ||
        form.studentSectionController.text.isEmpty ||
        form.studentSemesterController.text.isEmpty ||
        form.studentDeptController.text.isEmpty ||
        date.submissionDateController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
