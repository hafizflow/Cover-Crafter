import 'package:cover_page/features/personalization/controllers/form_controller.dart';

import '../../../../utils/local_storage/local_storage.dart';

class StudentLocalStorage {
  final _storage = CLocalStorage();
  final form = FormController.instance;

  // Method to save student information
  void setStudentInfo() {
    _storage.saveData('studentName', form.studentNameController.text);
    _storage.saveData('studentId', form.studentIdController.text);
    _storage.saveData('studentSection', form.studentSectionController.text);
    _storage.saveData('studentDepartment', form.studentDeptController.text);
    _storage.saveData('studentSemester', form.studentSemesterController.text);
  }

  // Retrieving data
  void getStudentInfo() {
    form.studentNameController.text =
        _storage.readData<String>('studentName') ?? "";
    form.studentIdController.text =
        _storage.readData<String>('studentId') ?? "";
    form.studentSectionController.text =
        _storage.readData<String>('studentSection') ?? "";
    form.studentDeptController.text =
        _storage.readData<String>('studentDepartment') ?? "";
    form.studentSemesterController.text =
        _storage.readData<String>('studentSemester') ?? "";
  }
}
