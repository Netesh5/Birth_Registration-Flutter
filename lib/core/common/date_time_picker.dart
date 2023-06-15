import 'package:flutter/material.dart';

Future<DateTime?> customDatePicker(BuildContext context) {
  return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now());
}

Future<TimeOfDay?> customTimePicker(BuildContext context) {
  return showTimePicker(context: context, initialTime: TimeOfDay.now());
}
