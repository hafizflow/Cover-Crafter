import 'package:circular_menu/circular_menu.dart';
import 'package:cover_page/features/personalization/controllers/pdf_controller.dart';
import 'package:cover_page/features/personalization/screens/widgets/pdf_view/open_pdf.dart';
import 'package:cover_page/features/personalization/screens/widgets/pdf_view/pdf_design.dart';
import 'package:cover_page/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

import '../../../utils/constants/colors.dart';
import '../controllers/form_controller.dart';

class PDFViewScreen extends StatefulWidget {
  const PDFViewScreen({super.key});

  @override
  State<PDFViewScreen> createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  final pdfInit = Get.find<PDFController>();
  final formController = FormController.instance;

  final showPdf = OpenPdf();
  final pdfDesign = PdfDesign();

  @override
  void initState() {
    super.initState();
    pdfInit.pdfInit();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      // backgroundColor: CColors.dark,
      appBar: AppBar(
        title: const Text('PDF', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor:
            isDark ? CColors.buttonPrimary : CColors.buttonSecondary,
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: CircularMenu(
          radius: 80,
          alignment: Alignment.bottomRight,
          items: [
            CircularMenuItem(icon: Icons.home, onTap: () {}),
            CircularMenuItem(icon: Icons.search, onTap: () {}),
            CircularMenuItem(icon: Icons.settings, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
