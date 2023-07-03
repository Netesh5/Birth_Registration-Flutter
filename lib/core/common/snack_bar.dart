import 'package:flutter/material.dart';

customSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
