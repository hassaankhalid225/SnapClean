import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get toFormattedDate {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  String get toFormattedTime {
    return DateFormat('hh:mm a').format(this);
  }
}
