import 'package:cover_page/features/personalization/controllers/date_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(DateController());
  }
}
