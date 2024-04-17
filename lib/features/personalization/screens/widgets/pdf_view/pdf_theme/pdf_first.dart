import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../../../common/styles/pdf_view/pdf_spacing.dart';
import '../../../../../../common/styles/pdf_view/pdf_text_style.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../controllers/form/date_controller.dart';
import '../../../../controllers/form/form_controller.dart';

class PdfFirst {
  final formController = FormController.instance;
  final dateController = DateController.instance;

  bool getHeight() {
    if (formController.universityLogoController.text == "" ||
        formController.studentUniversityIdController.text == "1") {
      return true;
    } else {
      return false;
    }
  }

  bool getTitleOrExperimentName() {
    if (formController.coverPageController.text == "" ||
        formController.coverPageController.text == "Assignment") {
      return true;
    } else {
      return false;
    }
  }

  Future<Uint8List> generatePdf(final PdfPageFormat pageFormat) async {
    final pdf = pw.Document();

    final img = await rootBundle.load(
      formController.universityLogoController.text == ""
          ? CImages.myUniversity
          : formController.universityLogoController.text,
    );

    final imageBytes = img.buffer.asUint8List();
    pw.Image image = pw.Image(pw.MemoryImage(imageBytes));

    // final font = await rootBundle.load("assets/fonts/open-sans.regular.ttf");
    // final ttf = Font.ttf(font);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Stack(
            children: [
              pw.Column(
                children: [
                  pw.SizedBox(height: getHeight() ? 35 : 20),
                  pw.Container(
                      height: getHeight() ? 85 : 120,
                      child: image,
                      alignment: pw.Alignment.center),
                  pw.SizedBox(height: PDFSpacing.spaceBtwSection - 4),
                  pw.Text(
                    formController.coverPageController.text.trim(),
                    style: PDFTextStyle.headingTextStyle,
                  ),
                ],
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.symmetric(horizontal: 24),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 200),

                    /// Course Code and title
                    pw.RichText(
                      text: pw.TextSpan(
                        text: 'Course Code : ',
                        style: PDFTextStyle.boldTextStyle,
                        children: [
                          pw.TextSpan(
                            text:
                                formController.courseCodeController.text.trim(),
                            style: PDFTextStyle.normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                    pw.RichText(
                      text: pw.TextSpan(
                        text: 'Course Title : ',
                        style: PDFTextStyle.boldTextStyle,
                        children: [
                          pw.TextSpan(
                            text:
                                formController.courseNameController.text.trim(),
                            style: PDFTextStyle.normalTextStyle,
                          ),
                        ],
                      ),
                    ),

                    pw.SizedBox(height: PDFSpacing.spaceBtwSection),

                    getTitleOrExperimentName()
                        ?

                        /// Title
                        pw.RichText(
                            text: pw.TextSpan(
                              text: 'Title : ',
                              style: PDFTextStyle.boldTextStyle,
                              children: [
                                pw.TextSpan(
                                  text: formController.titleController.text
                                      .trim(),
                                  style: PDFTextStyle.normalTextStyle,
                                ),
                              ],
                            ),
                          )
                        :

                        /// Experiment No and Name
                        pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.RichText(
                                text: pw.TextSpan(
                                  text: 'Experiment No : ',
                                  style: PDFTextStyle.boldTextStyle,
                                  children: [
                                    pw.TextSpan(
                                      text: formController
                                          .experimentNoController.text
                                          .trim(),
                                      style: PDFTextStyle.normalTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                              pw.RichText(
                                text: pw.TextSpan(
                                  text: 'Experiment Name : ',
                                  style: PDFTextStyle.boldTextStyle,
                                  children: [
                                    pw.TextSpan(
                                      text: formController
                                          .experimentNameController.text
                                          .trim(),
                                      style: PDFTextStyle.normalTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                    /// Teacher information
                    pw.SizedBox(height: 30),
                    pw.Text(
                      'Submitted To',
                      style: pw.TextStyle(
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.blue,
                      ),
                    ),
                    pw.SizedBox(height: PDFSpacing.spaceBtwSection - 4),
                    pw.Text(
                      formController.teacherNameController.text.trim(),
                      style: PDFTextStyle.boldTextStyle,
                    ),
                    pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                    pw.Text(
                      formController.teacherDepartmentController.text.trim(),
                      style: PDFTextStyle.boldTextStyle,
                    ),
                    pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                    pw.RichText(
                      text: pw.TextSpan(
                        text: formController.teacherDesignationController.text
                            .trim(),
                        style: PDFTextStyle.boldTextStyle,
                        children: [
                          pw.TextSpan(
                            text:
                                ', ${formController.universityShortNameController.text.trim()}',
                            style: PDFTextStyle.boldTextStyle,
                          ),
                        ],
                      ),
                    ),

                    /// Student Information
                    pw.SizedBox(height: 30),
                    pw.Text(
                      'Submitted By',
                      style: pw.TextStyle(
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.blue,
                      ),
                    ),
                    pw.SizedBox(height: PDFSpacing.spaceBtwSection - 4),
                    pw.RichText(
                      text: pw.TextSpan(
                        text: 'Name : ',
                        style: PDFTextStyle.boldTextStyle,
                        children: [
                          pw.TextSpan(
                            text: formController.studentNameController.text
                                .trim(),
                            style: PDFTextStyle.normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                    pw.RichText(
                      text: pw.TextSpan(
                        text: 'ID : ',
                        style: PDFTextStyle.boldTextStyle,
                        children: [
                          pw.TextSpan(
                            text:
                                formController.studentIdController.text.trim(),
                            style: PDFTextStyle.normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                    pw.RichText(
                      text: pw.TextSpan(
                        text: 'Section : ',
                        style: PDFTextStyle.boldTextStyle,
                        children: [
                          pw.TextSpan(
                            text: formController.studentSectionController.text
                                .trim(),
                            style: PDFTextStyle.normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                    pw.RichText(
                      text: pw.TextSpan(
                        text: 'Semester : ',
                        style: PDFTextStyle.boldTextStyle,
                        children: [
                          pw.TextSpan(
                            text: formController.studentSemesterController.text
                                .trim(),
                            style: PDFTextStyle.normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                    pw.RichText(
                      text: pw.TextSpan(
                        text: 'Department : ',
                        style: PDFTextStyle.boldTextStyle,
                        children: [
                          pw.TextSpan(
                            text: formController.studentDeptController.text
                                .trim(),
                            style: PDFTextStyle.normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                    pw.Text(
                      formController.universityFullNameController.text.trim(),
                      style: PDFTextStyle.boldTextStyle,
                    ),
                  ],
                ),
              ),
              pw.Center(
                child: pw.Column(
                  children: [
                    pw.SizedBox(height: 675),
                    pw.RichText(
                      text: pw.TextSpan(
                        text: 'Submission Date : ',
                        style: PDFTextStyle.boldTextStyle,
                        children: [
                          pw.TextSpan(
                            text: dateController.submissionDateController.text
                                .trim(),
                            style: PDFTextStyle.normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              pw.Container(
                width: pageFormat.width,
                height: pageFormat.height,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.blue, width: 5),
                ),
              ),
            ],
          );
        },
      ),
    ); // Page

    return pdf.save();
  }
}
