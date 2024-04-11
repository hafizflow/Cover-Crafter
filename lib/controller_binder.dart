import 'package:cover_page/features/personalization/controllers/date_controller.dart';
import 'package:cover_page/features/personalization/controllers/field_controller.dart';
import 'package:cover_page/features/personalization/controllers/form_controller.dart';
import 'package:cover_page/features/personalization/controllers/pdf_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(DateController());
    Get.put(PDFController());
    Get.put(FormController());
    Get.put(FieldController());
  }
}
