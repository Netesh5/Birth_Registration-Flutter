import 'package:flutter/material.dart';

customSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.green);
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
