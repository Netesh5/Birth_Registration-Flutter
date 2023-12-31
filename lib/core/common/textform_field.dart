import 'package:birthregistration/core/extension/email_validator.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatefulWidget {
  const CustomTextFormFiled({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    required this.spacing,
    required this.isPasswordFormField,
    this.ontap,
    this.isreadOnly = false,
    this.isBirthCertificateForm = false,
    this.isregistrationForm = false,
  });
  final String title;
  final String hintText;
  final TextEditingController controller;
  final double spacing;
  final Function()? ontap;
  final bool? isreadOnly;

  final bool isPasswordFormField;
  final bool isBirthCertificateForm;
  final bool isregistrationForm;
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
          onTap: widget.ontap,
          controller: widget.controller,
          readOnly: widget.isreadOnly ?? false,
          obscureText: widget.isPasswordFormField ? isObsureText : false,
          textInputAction: TextInputAction.next,
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
            } else if (!widget.isPasswordFormField &&
                !widget.isBirthCertificateForm &&
                !widget.isregistrationForm) {
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
