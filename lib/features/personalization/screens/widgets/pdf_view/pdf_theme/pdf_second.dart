import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../../../common/styles/pdf_view/pdf_spacing.dart';
import '../../../../../../common/styles/pdf_view/pdf_text_style.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../controllers/form/date_controller.dart';
import '../../../../controllers/form/form_controller.dart';

class PdfSecond {
  final form = FormController.instance;
  final dateController = DateController.instance;

  String getImage() {
    if (form.universityLogoController.text == CImages.myUniversity) {
      return CImages.diuLogo;
    } else {
      return form.universityLogoController.text;
    }
  }

  bool getTitleOrExperimentName() {
    if (form.coverPageController.text == "" ||
        form.coverPageController.text == "Assignment") {
      return true;
    } else {
      return false;
    }
  }

  Future<Uint8List> generatePdf(final PdfPageFormat pageFormat) async {
    final pdf = pw.Document();

    final img = await rootBundle.load(
      form.universityLogoController.text == "" ? CImages.diuLogo : getImage(),
    );

    final imageBytes = img.buffer.asUint8List();
    pw.Image image = pw.Image(pw.MemoryImage(imageBytes));

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Stack(
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Container(
                    height: 140,
                    child: image,
                    alignment: pw.Alignment.center,
                  ),
                  pw.SizedBox(height: PDFSpacing.spaceBtwSection),
                  pw.Text(
                    form.universityFullNameController.text,
                    style: pw.TextStyle(
                      fontSize: form.universityFullNameController.text ==
                              CTexts.aiubFullName
                          ? 21
                          : 25,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    form.coverPageController.text,
                    style: pw.TextStyle(
                      fontSize: 28,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.deepPurple,
                    ),
                  ),
                  pw.Divider(
                    height: 12,
                    indent: 100,
                    endIndent: 100,
                    thickness: 2,
                  ),
                  pw.SizedBox(height: 8),

                  /// Course Code and title
                  pw.RichText(
                    text: pw.TextSpan(
                      text: 'Course Code : ',
                      style: PDFTextStyle.boldTextStyle,
                      children: [
                        pw.TextSpan(
                          text: form.courseCodeController.text,
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
                          text: form.courseNameController.text,
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
                                text: form.titleController.text,
                                style: PDFTextStyle.normalTextStyle,
                              ),
                            ],
                          ),
                        )
                      :

                      /// Experiment No and Name
                      pw.Column(children: [
                          pw.RichText(
                            text: pw.TextSpan(
                              text: 'Experiment No : ',
                              style: PDFTextStyle.boldTextStyle,
                              children: [
                                pw.TextSpan(
                                  text: form.experimentNoController.text,
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
                                  text: form.experimentNameController.text,
                                  style: PDFTextStyle.normalTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ]),

                  /// Teacher information
                  pw.SizedBox(height: 16),
                  pw.Text(
                    'Submitted To',
                    style: pw.TextStyle(
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.deepPurple,
                    ),
                  ),
                  pw.SizedBox(height: PDFSpacing.spaceBtwSection - 8),
                  pw.Text(
                    form.teacherNameController.text,
                    style: PDFTextStyle.boldTextStyle,
                  ),
                  pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                  pw.Text(
                    form.teacherDepartmentController.text,
                    style: PDFTextStyle.boldTextStyle,
                  ),
                  pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                  pw.RichText(
                    text: pw.TextSpan(
                      text: form.teacherDesignationController.text,
                      style: PDFTextStyle.boldTextStyle,
                      children: [
                        pw.TextSpan(
                          text: ', ${form.universityShortNameController.text}',
                          style: PDFTextStyle.boldTextStyle,
                        ),
                      ],
                    ),
                  ),

                  /// Student Information
                  pw.SizedBox(height: 24),
                  pw.Text(
                    'Submitted By',
                    style: pw.TextStyle(
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.deepPurple,
                    ),
                  ),
                  pw.SizedBox(height: PDFSpacing.spaceBtwSection - 8),
                  pw.RichText(
                    text: pw.TextSpan(
                      text: 'Name : ',
                      style: PDFTextStyle.boldTextStyle,
                      children: [
                        pw.TextSpan(
                          text: form.studentNameController.text,
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
                          text: form.studentIdController.text,
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
                          text: form.studentSectionController.text,
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
                          text: form.studentSemesterController.text,
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
                          text: form.studentDeptController.text,
                          style: PDFTextStyle.normalTextStyle,
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: PDFSpacing.spaceBtwSection + 16),

                  pw.Container(
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 1.5,
                      ),
                      borderRadius: pw.BorderRadius.circular(5.0),
                    ),
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.RichText(
                      text: pw.TextSpan(
                        text: 'Submission Date : ',
                        style: PDFTextStyle.boldTextStyle,
                        children: [
                          pw.TextSpan(
                            text: dateController.submissionDateController.text,
                            style: PDFTextStyle.normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    ); // Page

    return pdf.save();
  }
}
