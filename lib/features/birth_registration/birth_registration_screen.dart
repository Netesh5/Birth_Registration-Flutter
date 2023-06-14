import 'package:birthregistration/core/common/divider.dart';
import 'package:birthregistration/core/common/textform_field.dart';
import 'package:flutter/material.dart';

class BirthRegistrationScreen extends StatefulWidget {
  const BirthRegistrationScreen({super.key});

  @override
  State<BirthRegistrationScreen> createState() =>
      _BirthRegistrationScreenState();
}

class _BirthRegistrationScreenState extends State<BirthRegistrationScreen> {
  late final TextEditingController firstNameController;
  late final TextEditingController middleNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController dob;

  @override
  void initState() {
    firstNameController = TextEditingController();
    middleNameController = TextEditingController();
    lastNameController = TextEditingController();
    dob = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    dob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Birth Registration",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Personal Information",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomDivider(
                      color: Colors.grey,
                    ),

                    //Name
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormFiled(
                              title: "Name",
                              hintText: "First name",
                              controller: firstNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: CustomTextFormFiled(
                              title: "",
                              hintText: "Middle name",
                              controller: middleNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: CustomTextFormFiled(
                              title: "",
                              hintText: "Last name",
                              controller: lastNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDivider(color: Colors.grey.shade400),
                    //Second Row
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormFiled(
                              title: "Date of Birth",
                              hintText: "Choose Date",
                              controller: firstNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: CustomTextFormFiled(
                              title: "Time",
                              hintText: "Choose Time",
                              controller: middleNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: CustomTextFormFiled(
                              title: "Birth site",
                              hintText: "Choose Birth site",
                              controller: lastNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: CustomTextFormFiled(
                              title: "Gender",
                              hintText: "choose Gender",
                              controller: lastNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
