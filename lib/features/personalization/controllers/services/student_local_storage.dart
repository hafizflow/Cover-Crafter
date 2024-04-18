import 'package:cover_page/features/personalization/controllers/form/date_controller.dart';
import 'package:get_storage/get_storage.dart';
import '../form/form_controller.dart';

class StudentLocalStorage {
  final _storage = GetStorage();
  final form = FormController.instance;
  final date = DateController.instance;

  void setStudentInfo() {
    _storage.write('studentName', form.studentNameController.text.trim());
    _storage.write('studentId', form.studentIdController.text.trim());
    _storage.write('studentSection', form.studentSectionController.text.trim());
    _storage.write('studentDepartment', form.studentDeptController.text.trim());
    _storage.write(
        'studentSemester', form.studentSemesterController.text.trim());
    _storage.write(
        'studentUniversityId', form.studentUniversityIdController.text);
    // _storage.write('coverPageType', form.coverPageController.text);

    _storage.write('universityLogo', form.universityLogoController.text);
    _storage.write(
        'universityShortName', form.universityShortNameController.text);
    _storage.write(
        'universityFullName', form.universityFullNameController.text);
  }

  void getStudentInfo() {
    form.studentNameController.text = _storage.read('studentName') ?? "";
    form.studentIdController.text = _storage.read('studentId') ?? "";
    form.studentSectionController.text = _storage.read('studentSection') ?? "";
    form.studentDeptController.text = _storage.read('studentDepartment') ?? "";
    form.studentSemesterController.text =
        _storage.read('studentSemester') ?? "";
    form.studentUniversityIdController.text =
        _storage.read('studentUniversityId') ?? "";
    // form.coverPageController.text = _storage.read('coverPageType') ?? "";
    form.universityLogoController.text = _storage.read('universityLogo') ?? "";
    form.universityShortNameController.text =
        _storage.read('universityShortName') ?? "";
    form.universityFullNameController.text =
        _storage.read('universityFullName') ?? "";
  }

  void eraseAllData() {
    _storage.erase();
    form.studentNameController.clear();
    form.studentIdController.clear();
    form.studentSectionController.clear();
    form.studentDeptController.clear();
    form.studentSemesterController.clear();
    form.studentUniversityIdController.clear();
    form.universityLogoController.clear();
    form.universityShortNameController.clear();
    form.universityFullNameController.clear();
    form.coverPageController.clear();
    form.courseCodeController.clear();
    form.courseNameController.clear();
    form.experimentNoController.clear();
    form.experimentNameController.clear();
    form.teacherNameController.clear();
    form.teacherDepartmentController.clear();
    form.teacherDesignationController.clear();
    date.submissionDateController.clear();
    form.titleController.clear();
  }
}
