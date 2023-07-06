import 'package:birthregistration/core/common/circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.color,
      required this.ontap});
  final String title;
  final Color color;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: ontap,
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => color)),
        child: Text(title),
      ),
    );
  }
}

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => color)),
          child: const CustomCircularProgressIndicator()),
    );
  }
}
