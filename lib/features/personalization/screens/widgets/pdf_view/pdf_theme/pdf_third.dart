import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import '../../../../../../common/styles/pdf_view/pdf_spacing.dart';
import '../../../../../../common/styles/pdf_view/pdf_text_style.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../controllers/form/date_controller.dart';
import '../../../../controllers/form/form_controller.dart';

class PdfThird {
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

    final font = await rootBundle.load("assets/fonts/Poppins-BoldItalic.ttf");
    final ttf = Font.ttf(font);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Stack(
            children: [
              pw.Column(
                children: [
                  pw.Text(
                    form.universityFullNameController.text,
                    style: pw.TextStyle(
                      fontSize: form.universityFullNameController.text ==
                              CTexts.aiubFullName
                          ? 21
                          : 25,
                      // fontWeight: pw.FontWeight.bold,
                      font: ttf,
                    ),
                  ),
                  pw.SizedBox(height: PDFSpacing.spaceBtwSection),
                  pw.Container(
                      height: 130,
                      child: image,
                      alignment: pw.Alignment.center),
                  pw.SizedBox(height: PDFSpacing.spaceBtwSection - 8),
                  pw.Text(
                    form.coverPageController.text.trim(),
                    style: PDFTextStyle.headingTextStyle.copyWith(fontSize: 24),
                  ),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 250),

                  /// Course Code and title
                  pw.RichText(
                    text: pw.TextSpan(
                      text: 'Course Code : ',
                      style: PDFTextStyle.boldTextStyle,
                      children: [
                        pw.TextSpan(
                          text: form.courseCodeController.text.trim(),
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
                          text: form.courseNameController.text.trim(),
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
                                text: form.titleController.text.trim(),
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
                                    text:
                                        form.experimentNoController.text.trim(),
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
                                    text: form.experimentNameController.text
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
                      color: PdfColors.teal,
                    ),
                  ),
                  pw.SizedBox(height: PDFSpacing.spaceBtwSection - 4),
                  pw.Text(
                    form.teacherNameController.text.trim(),
                    style: PDFTextStyle.boldTextStyle,
                  ),
                  pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                  pw.Text(
                    form.teacherDepartmentController.text.trim(),
                    style: PDFTextStyle.boldTextStyle,
                  ),
                  pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                  pw.RichText(
                    text: pw.TextSpan(
                      text: form.teacherDesignationController.text.trim(),
                      style: PDFTextStyle.boldTextStyle,
                      children: [
                        pw.TextSpan(
                          text:
                              ', ${form.universityShortNameController.text.trim()}',
                          style: PDFTextStyle.boldTextStyle,
                        ),
                      ],
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 250),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        /// Student Information
                        pw.SizedBox(height: 30),
                        pw.Text(
                          'Submitted By',
                          style: pw.TextStyle(
                            fontSize: 20,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.teal,
                          ),
                        ),
                        pw.SizedBox(height: PDFSpacing.spaceBtwSection - 4),
                        pw.RichText(
                          text: pw.TextSpan(
                            text: 'Name : ',
                            style: PDFTextStyle.boldTextStyle,
                            children: [
                              pw.TextSpan(
                                text: form.studentNameController.text.trim(),
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
                                text: form.studentIdController.text.trim(),
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
                                text: form.studentSectionController.text.trim(),
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
                                text:
                                    form.studentSemesterController.text.trim(),
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
                                text: form.studentDeptController.text.trim(),
                                style: PDFTextStyle.normalTextStyle,
                              ),
                            ],
                          ),
                        ),
                        pw.SizedBox(height: PDFSpacing.spaceBtwItem),
                      ],
                    ),
                  ),
                ],
              ),
              pw.Center(
                child: pw.Column(
                  children: [
                    pw.SizedBox(height: 700),
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
            ],
          );
        },
      ),
    ); // Page

    return pdf.save();
  }
}
