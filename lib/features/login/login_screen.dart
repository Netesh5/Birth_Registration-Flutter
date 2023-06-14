import 'package:birthregistration/core/common/custom_button.dart';
import 'package:birthregistration/core/constants/app_string.dart';
import 'package:birthregistration/core/constants/textform_field.dart';
import 'package:birthregistration/core/routes/routes_constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        title: const Text(
          "Birth Registration System",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              // height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(children: [
                      const Text(
                        AppString.loginToProcced,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextFormFiled(
                        title: "Email",
                        hintText: "Enter your Email",
                        controller: emailController,
                        spacing: 20,
                        isPasswordFormField: false,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextFormFiled(
                        title: "Password",
                        hintText: "Enter your Password",
                        controller: passwordController,
                        spacing: 20,
                        isPasswordFormField: true,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: 300,
                        child: CustomButton(
                            title: "Login",
                            color: Colors.deepPurpleAccent,
                            ontap: () {
                              if (formKey.currentState!.validate()) {
                                context.pushReplacementNamed(
                                    RouteConstant.birthRegistrationScreen);
                              }
                            }),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                          text: "New to the system ? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: "Register Now",
                          style:
                              const TextStyle(color: Colors.deepPurpleAccent),
                        )
                      ]))
                    ]),
                  ))),
        ),
      ),
    );
  }
}
