import 'package:birthregistration/core/common/custom_button.dart';
import 'package:birthregistration/core/common/textform_field.dart';
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextFormFiled(
                          title: "Fullname",
                          hintText: "Enter your Name",
                          controller: fullnameController,
                          spacing: 20,
                          isPasswordFormField: false),
                      CustomTextFormFiled(
                          title: "Email",
                          hintText: "Enter your Email",
                          controller: emailController,
                          spacing: 20,
                          isPasswordFormField: false),
                      CustomTextFormFiled(
                          title: "Password",
                          hintText: "Enter your password",
                          controller: passwordController,
                          spacing: 20,
                          isPasswordFormField: false),
                      CustomTextFormFiled(
                          title: "Location",
                          hintText: "Enter your Location",
                          controller: locationController,
                          spacing: 20,
                          isPasswordFormField: false),
                      CustomTextFormFiled(
                          title: "Phone",
                          hintText: "Enter your Phone",
                          controller: phoneController,
                          spacing: 20,
                          isPasswordFormField: false),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 300,
                        child: CustomButton(
                            title: "Register",
                            color: Colors.deepPurpleAccent,
                            ontap: () {}),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
