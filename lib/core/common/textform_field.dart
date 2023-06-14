import 'package:birthregistration/core/extension/email_validator.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatefulWidget {
  const CustomTextFormFiled(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.spacing,
      required this.isPasswordFormField});
  final String title;
  final String hintText;
  final TextEditingController controller;
  final double spacing;

  final bool isPasswordFormField;

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  bool isObsureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.spacing,
        ),
        Text(widget.title),
        SizedBox(
          height: widget.spacing,
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPasswordFormField ? isObsureText : false,
          decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.isPasswordFormField
                  ? isObsureText
                      ? IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            isObsureText = !isObsureText;
                            setState(() {});
                          },
                        )
                      : IconButton(
                          icon: const Icon(Icons.visibility_off),
                          onPressed: () {
                            isObsureText = !isObsureText;
                            setState(() {});
                          },
                        )
                  : null),
          validator: (value) {
            if (widget.controller.text.isEmpty) {
              return "Field cannot be empty";
            } else if (!widget.isPasswordFormField) {
              if (!widget.controller.text.isValidEmail()) {
                return "Enter valid Email";
              }
              return null;
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
