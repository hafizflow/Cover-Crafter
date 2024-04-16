import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:pdf/pdf.dart';

import '../../screens/widgets/pdf_view/pdf_theme/pdf_first.dart';
import '../../screens/widgets/pdf_view/pdf_theme/pdf_second.dart';
import '../../screens/widgets/pdf_view/pdf_theme/pdf_third.dart';

class PdfThemeController extends GetxController {
  static PdfThemeController get instance => Get.find();

  final first = PdfFirst();
  final second = PdfSecond();
  final third = PdfThird();

  int _pdfPage = 1;
  int get pdfPage => _pdfPage;

  void setPdfTheme(int val) {
    _pdfPage = val;
    update();
  }

  // pdf download page update
  Future<Uint8List> updateDownloadPage(PdfPageFormat a4) {
    switch (_pdfPage) {
      case 1:
        return first.generatePdf(PdfPageFormat.a4);
      case 2:
        return second.generatePdf(PdfPageFormat.a4);
      case 3:
        return third.generatePdf(PdfPageFormat.a4);
      default:
        return first.generatePdf(PdfPageFormat.a4);
    }
  }

  // pdf view page update
  updateViewPage() {
    switch (_pdfPage) {
      case 1:
        return first.generatePdf;
      case 2:
        return second.generatePdf;
      case 3:
        return third.generatePdf;
      default:
        return first.generatePdf;
    }
  }
}
