import 'dart:developer';
import 'dart:io';

import 'package:cover_page/features/personalization/controllers/pdf/pdf_theme_controller.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import '../form/form_controller.dart';

class OpenPdf {
  final formController = FormController.instance;
  final pdfThemeController = PdfThemeController.instance;
  Future<void> openPdf() async {
    try {
      final pdfBytes =
          await pdfThemeController.updateDownloadPage(PdfPageFormat.a4);
      final directory = await getExternalStorageDirectory();
      final filePath =
          '${directory?.path}/${formController.courseNameController.text}.pdf';

      File file = File(filePath);
      await file.writeAsBytes(pdfBytes as List<int>);

      await OpenFile.open(filePath, type: 'application/pdf', uti: 'public.pdf');
    } catch (e) {
      /// show error message to user
      log('Error Downloading: $e');
    }
  }
}
