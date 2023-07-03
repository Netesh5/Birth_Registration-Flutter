import 'package:birthregistration/core/common/custom_button.dart';
import 'package:birthregistration/core/common/textform_field.dart';
import 'package:birthregistration/firebase_services/authentication/auth.dart';

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController fullnameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController locationController;
  late final TextEditingController phoneController;
  final AuthService authService = AuthService();

  final formKey = GlobalKey<FormState>();
  final bool isloading = false;

  @override
  void initState() {
    fullnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    locationController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    locationController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Register",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.grey.shade200,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextFormFiled(
                          title: "Fullname",
                          hintText: "Enter your Name",
                          controller: fullnameController,
                          spacing: 20,
                          isPasswordFormField: false,
                          isregistrationForm: true,
                        ),
                        CustomTextFormFiled(
                          title: "Email",
                          hintText: "Enter your Email",
                          controller: emailController,
                          spacing: 20,
                          isPasswordFormField: false,
                          isregistrationForm: false,
                        ),
                        CustomTextFormFiled(
                          title: "Password",
                          hintText: "Enter your password",
                          controller: passwordController,
                          spacing: 20,
                          isPasswordFormField: true,
                          isregistrationForm: true,
                        ),
                        CustomTextFormFiled(
                          title: "Location",
                          hintText: "Enter your Location",
                          controller: locationController,
                          spacing: 20,
                          isPasswordFormField: false,
                          isregistrationForm: true,
                        ),
                        CustomTextFormFiled(
                          title: "Phone",
                          hintText: "Enter your Phone",
                          controller: phoneController,
                          spacing: 20,
                          isPasswordFormField: false,
                          isregistrationForm: true,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: 300,
                          child: CustomButton(
                              title: "Register",
                              color: Colors.deepPurpleAccent,
                              ontap: () async {
                                if (formKey.currentState!.validate()) {
                                  await authService.registerUser(
                                      context: context,
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                      fullname: fullnameController.text.trim(),
                                      location: locationController.text.trim(),
                                      phone: phoneController.text.trim());
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
