import 'package:get/get.dart';
import 'package:printing/printing.dart';

class PDFController extends GetxController {
  PrintingInfo? printingInfo;

  Future<void> pdfInit() async {
    final info = await Printing.info();
    printingInfo = info;
    update();
  }
}
