import 'dart:developer';
import 'dart:io';

import 'package:cover_page/features/personalization/screens/widgets/pdf_view/pdf_design.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import '../../../controllers/form_controller.dart';

class OpenPdf {
  final formController = FormController.instance;
  final pdf = PdfDesign();
  Future<void> openPdf() async {
    try {
      final pdfBytes = await pdf.generatePdf(PdfPageFormat.a4);
      final directory = await getExternalStorageDirectory();
      final filePath =
          '${directory?.path}/${formController.courseNameController.text}.pdf';

      File file = File(filePath);
      await file.writeAsBytes(pdfBytes);

      await OpenFile.open(filePath, type: 'application/pdf', uti: 'public.pdf');
    } catch (e) {
      /// show error message to user
      log('Error Downloading: $e');
    }
  }
}
