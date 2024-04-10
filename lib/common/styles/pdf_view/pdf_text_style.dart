import 'package:pdf/widgets.dart' as pw;

class PDFTextStyle {
  final pdf = pw.Document();

  static pw.TextStyle boldTextStyle = pw.TextStyle(
    fontSize: 17,
    fontWeight: pw.FontWeight.bold,
  );

  static pw.TextStyle normalTextStyle = pw.TextStyle(
    fontSize: 17,
    fontWeight: pw.FontWeight.normal,
  );

  static pw.TextStyle headingTextStyle = pw.TextStyle(
    fontSize: 28,
    fontWeight: pw.FontWeight.bold,
  );
}
