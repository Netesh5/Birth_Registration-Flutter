import 'package:intl/intl.dart';

extension DateTimeParsing on DateTime {
  String toWeekDayMonthWithTime() {
    final weekDays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    final weekDay = weekDays[weekday - 1];
    final month = months[this.month - 1];

    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');

    return '$weekDay, $month $day, $year $hour:$minute';
  }

  String formatToNumericDate() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this);
  }
}
