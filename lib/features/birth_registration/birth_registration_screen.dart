import 'package:birthregistration/core/common/date_time_picker.dart';
import 'package:birthregistration/core/common/divider.dart';
import 'package:birthregistration/core/common/textform_field.dart';
import 'package:birthregistration/core/constants/app_string.dart';
import 'package:birthregistration/core/extension/date_time.dart';
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
  late final TextEditingController timeController;

  @override
  void initState() {
    firstNameController = TextEditingController();
    middleNameController = TextEditingController();
    lastNameController = TextEditingController();
    dob = TextEditingController();
    timeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    dob.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppString.birthRegs,
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
                      AppString.personalInfo,
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
                              title: AppString.name,
                              hintText: AppString.firstName,
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
                              hintText: AppString.middleName,
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
                              hintText: AppString.lastName,
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
                            title: AppString.dob,
                            hintText: AppString.chooseDate,
                            controller: dob,
                            spacing: 20,
                            isPasswordFormField: false,
                            isreadOnly: true,
                            ontap: () async {
                              final date = await customDatePicker(context);
                              if (date == null) {
                                return;
                              } else {
                                dob.text = date.formatToNumericDate();
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: CustomTextFormFiled(
                            title: AppString.time,
                            hintText: AppString.chooseTime,
                            controller: timeController,
                            spacing: 20,
                            isPasswordFormField: false,
                            isreadOnly: true,
                            ontap: () async {
                              final time = await customTimePicker(context);
                              if (time == null) return;

                              // ignore: use_build_context_synchronously
                              timeController.text = time.format(context);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: CustomTextFormFiled(
                              title: AppString.birthSite,
                              hintText: AppString.chooseBirthSite,
                              controller: lastNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: CustomTextFormFiled(
                              title: AppString.gender,
                              hintText: AppString.chooseGender,
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

                    //third row
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormFiled(
                              title: AppString.cast,
                              hintText: AppString.chooseCast,
                              controller: firstNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: CustomTextFormFiled(
                              title: AppString.birthType,
                              hintText: AppString.chooseBirthType,
                              controller: middleNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: CustomTextFormFiled(
                              title: AppString.weight,
                              hintText: AppString.chooseWeight,
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

                    //fourth row

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormFiled(
                              title: AppString.address,
                              hintText: AppString.enterBirthAddress,
                              controller: firstNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: CustomTextFormFiled(
                              title: AppString.vcd,
                              hintText: AppString.enterVDC,
                              controller: middleNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          child: CustomTextFormFiled(
                              title: AppString.wardno,
                              hintText: AppString.enterWardno,
                              controller: lastNameController,
                              spacing: 20,
                              isPasswordFormField: false),
                        ),
                      ],
                    ),
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
