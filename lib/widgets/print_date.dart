import 'package:pharma_ssist/models/date_model.dart';

class PrintDate{
  DateModel date;
  PrintDate({required this.date});
  static String getDate(DateModel date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}