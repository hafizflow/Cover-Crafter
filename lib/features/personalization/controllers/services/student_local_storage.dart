import 'package:get_storage/get_storage.dart';
import '../form/form_controller.dart';

class StudentLocalStorage {
  final _storage = GetStorage();
  final form = FormController.instance;

  void setStudentInfo() {
    _storage.write('studentName', form.studentNameController.text.trim());
    _storage.write('studentId', form.studentIdController.text.trim());
    _storage.write('studentSection', form.studentSectionController.text.trim());
    _storage.write('studentDepartment', form.studentDeptController.text.trim());
    _storage.write(
        'studentSemester', form.studentSemesterController.text.trim());
    // _storage.write(
    //     'studentUniversityId', form.studentUniversityIdController.text);
  }

  void getStudentInfo() {
    form.studentNameController.text = _storage.read('studentName');
    form.studentIdController.text = _storage.read('studentId');
    form.studentSectionController.text = _storage.read('studentSection');
    form.studentDeptController.text = _storage.read('studentDepartment');
    form.studentSemesterController.text = _storage.read('studentSemester');
    // form.studentUniversityIdController.text =
    //     _storage.read('studentUniversityId');
  }
}
