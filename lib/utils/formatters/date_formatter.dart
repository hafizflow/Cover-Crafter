import 'package:intl/intl.dart';

class CFormatter {
  // Format Date
  static String formatDate(DateTime? date) {
    /// null aware operator (??=)
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }
}
