import 'package:circular_menu/circular_menu.dart';
import 'package:cover_page/features/personalization/controllers/form/form_controller.dart';
import 'package:cover_page/features/personalization/controllers/pdf/pdf_controller.dart';
import 'package:cover_page/features/personalization/controllers/pdf/pdf_theme_controller.dart';
import 'package:cover_page/features/personalization/controllers/services/open_pdf.dart';
import 'package:cover_page/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:printing/printing.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class PDFViewScreen extends StatefulWidget {
  const PDFViewScreen({super.key});

  @override
  State<PDFViewScreen> createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  final pdfInit = Get.find<PDFController>();
  final pdfThemeController = PdfThemeController.instance;
  final form = FormController.instance;

  late String? pdfName = form.courseNameController.text.trim();

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
      body: GetBuilder<PdfThemeController>(builder: (theme) {
        return PdfPreview(
          pdfFileName: 'CoverPage:${form.courseNameController.text}',
          maxPageWidth: double.infinity,
          build: theme.updateViewPage(),
          canDebug: false,
          loadingWidget: LoadingAnimationWidget.staggeredDotsWave(
            color: CHelperFunctions.isDarkMode(context)
                ? Colors.teal
                : CColors.buttonSecondary,
            size: 50,
          ),
          canChangePageFormat: false,
          canChangeOrientation: false,
          previewPageMargin: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 8,
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => OpenPdf().openPdf(),
              icon: const Icon(
                Icons.file_download_outlined,
                size: 30,
              ),
            ),
          ],
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: CircularMenu(
          radius: 80,
          alignment: Alignment.bottomRight,
          items: [
            CircularMenuItem(
                iconSize: CSizes.iconSm + 4,
                icon: FontAwesomeIcons.one,
                onTap: () => pdfThemeController.setPdfTheme(1)),
            CircularMenuItem(
                iconSize: CSizes.iconSm + 4,
                icon: FontAwesomeIcons.two,
                onTap: () => pdfThemeController.setPdfTheme(2)),
            CircularMenuItem(
                iconSize: CSizes.iconSm + 4,
                icon: FontAwesomeIcons.three,
                onTap: () => pdfThemeController.setPdfTheme(3)),
          ],
        ),
      ),
    );
  }
}
