import 'package:cover_page/features/personalization/controllers/pdf_controller.dart';
import 'package:cover_page/features/personalization/screens/widgets/pdf_view/open_pdf.dart';
import 'package:cover_page/features/personalization/screens/widgets/pdf_view/pdf_design.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

import '../controllers/date_controller.dart';
import '../controllers/form_controller.dart';

class PDFViewScreen extends StatefulWidget {
  const PDFViewScreen({super.key});

  @override
  State<PDFViewScreen> createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  final pdfInit = Get.find<PDFController>();
  final showPdf = OpenPdf();
  final pdfDesign = PdfDesign();
  final formController = Get.find<FormController>();

  @override
  void initState() {
    super.initState();
    pdfInit.pdfInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: CColors.dark,
      appBar: AppBar(
        title: const Text('PDF'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Get.back(),
        ),
      ),
      body: PdfPreview(
        pdfFileName: formController.courseNameController.text,
        maxPageWidth: double.infinity,
        build: pdfDesign.generatePdf,
        canDebug: false,
        canChangeOrientation: false,
        previewPageMargin: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 8,
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => showPdf.openPdf(),
            icon: const Icon(Icons.file_download_outlined),
          ),
        ],
      ),
    );
  }
}
