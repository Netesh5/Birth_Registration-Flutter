import 'package:birthregistration/core/common/custom_button.dart';
import 'package:birthregistration/core/common/date_time_picker.dart';
import 'package:birthregistration/core/common/divider.dart';
import 'package:birthregistration/core/common/dropdown_formfield.dart';
import 'package:birthregistration/core/common/textform_field.dart';
import 'package:birthregistration/core/constants/app_string.dart';
import 'package:birthregistration/core/extension/date_time.dart';
import 'package:birthregistration/features/certificate_generator/certificate_generator.dart';
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
  late final TextEditingController dobController;
  late final TextEditingController timeController;
  late final TextEditingController weightController;
  late final TextEditingController addressController;
  late final TextEditingController vcdController;
  late final TextEditingController wardController;
  late final TextEditingController fatherNameController;
  late final TextEditingController fatherDOBController;
  late final TextEditingController fatherCountryController;
  late final TextEditingController motherNameController;
  late final TextEditingController motherDOBController;
  late final TextEditingController motherCountryController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    firstNameController = TextEditingController();
    middleNameController = TextEditingController();
    lastNameController = TextEditingController();
    dobController = TextEditingController();
    timeController = TextEditingController();
    weightController = TextEditingController();
    addressController = TextEditingController();
    vcdController = TextEditingController();
    wardController = TextEditingController();
    fatherCountryController = TextEditingController();
    fatherDOBController = TextEditingController();
    fatherNameController = TextEditingController();
    motherCountryController = TextEditingController();
    motherDOBController = TextEditingController();
    motherNameController = TextEditingController();
    super.initState();
  }

  List<String> birthSite = ["Others", "Health Post", "Hospital", "Home"];

  List<String> gender = ["Male", "Female", "Other"];
  List<String> cast = ["Bharmin", "Chhetri", "Newar", "Other", "Not Specified"];
  List<String> birthType = ["Single", "Twins", "Triplet or more"];
  List<String> fatherOccupation = [
    "Farmer",
    "Engineer",
    "Businessman",
    "Teacher",
    "Unemployeed",
    "Other"
  ];
  List<String> motherOccupation = [
    "Farmer",
    "Engineer",
    "Businessman",
    "Teacher",
    "Other",
    "House Wife"
  ];
  List<String> fatherReligion = [
    "Hindu",
    "Buddhist",
    "Muslim",
    "Christan",
    "Other",
  ];

  List<String> motherReligion = [
    "Hindu",
    "Budihist",
    "Muslim",
    "Christan",
    "Other",
  ];
  List<String> fatherMotherTounge = [
    "Nepali",
    "Newari",
    "Maithili",
    "Other",
  ];
  List<String> motherMotherTounge = [
    "Nepali",
    "Newari",
    "Maithili",
    "Other",
  ];
  String genderValue = "Male";
  String castValue = "Bharmin";
  String selectedValue = "Hospital";
  String birthTypeValue = "Single";
  String fatherOccupationValue = "Farmer";
  String motherOccupationValue = "Farmer";
  String fatherReligionValue = "Hindu";
  String motherReligionValue = "Hindu";
  String fatherMotherToungeValue = "Nepali";
  String motherMotherToungeValue = "Nepali";

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    timeController.dispose();
    weightController.dispose();
    addressController.dispose();
    vcdController.dispose();
    wardController.dispose();
    fatherCountryController.dispose();
    fatherNameController.dispose();
    fatherDOBController.dispose();
    motherCountryController.dispose();
    motherNameController.dispose();
    motherDOBController.dispose();
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
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        AppString.personalInfo,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
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
                              isPasswordFormField: false,
                              isBirthCertificateForm: true,
                            ),
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
                              isPasswordFormField: false,
                              isBirthCertificateForm: true,
                            ),
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
                              isPasswordFormField: false,
                              isBirthCertificateForm: true,
                            ),
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
                              controller: dobController,
                              spacing: 20,
                              isPasswordFormField: false,
                              isreadOnly: true,
                              isBirthCertificateForm: true,
                              ontap: () async {
                                final date = await customDatePicker(context);
                                if (date == null) {
                                  return;
                                } else {
                                  dobController.text =
                                      date.formatToNumericDate();
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
                              isBirthCertificateForm: true,
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
                            child: CustomDropDownFormField(
                              items: birthSite,
                              value: selectedValue,
                              title: AppString.birthSite,
                              onChanged: (p0) {
                                selectedValue = p0!;
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomDropDownFormField(
                              items: gender,
                              value: genderValue,
                              title: AppString.gender,
                              onChanged: (p0) {
                                genderValue = p0!;
                                setState(() {});
                              },
                            ),
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
                            child: CustomDropDownFormField(
                              items: cast,
                              value: castValue,
                              title: AppString.cast,
                              onChanged: (p0) {
                                castValue = p0!;
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomDropDownFormField(
                              items: birthType,
                              value: birthTypeValue,
                              title: AppString.birthType,
                              onChanged: (p0) {
                                birthTypeValue = p0!;
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomTextFormFiled(
                                title: AppString.weight,
                                hintText: AppString.chooseWeight,
                                controller: weightController,
                                spacing: 20,
                                isBirthCertificateForm: true,
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
                                controller: addressController,
                                spacing: 20,
                                isBirthCertificateForm: true,
                                isPasswordFormField: false),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomTextFormFiled(
                                title: AppString.vcd,
                                hintText: AppString.enterVDC,
                                controller: vcdController,
                                spacing: 20,
                                isBirthCertificateForm: true,
                                isPasswordFormField: false),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomTextFormFiled(
                                title: AppString.wardno,
                                hintText: AppString.enterWardno,
                                controller: wardController,
                                spacing: 20,
                                isBirthCertificateForm: true,
                                isPasswordFormField: false),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        AppString.parentInfo,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomDivider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        AppString.father,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),

                      //Father
                      // first row
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormFiled(
                                title: AppString.name,
                                hintText: AppString.name,
                                controller: fatherNameController,
                                spacing: 20,
                                isBirthCertificateForm: true,
                                isPasswordFormField: false),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomTextFormFiled(
                              title: AppString.dob,
                              hintText: AppString.chooseDate,
                              controller: fatherDOBController,
                              spacing: 20,
                              isPasswordFormField: false,
                              isBirthCertificateForm: true,
                              isreadOnly: true,
                              ontap: () async {
                                final date = await customDatePicker(context);
                                if (date == null) {
                                  return;
                                } else {
                                  fatherDOBController.text =
                                      date.formatToNumericDate();
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomTextFormFiled(
                                title: AppString.country,
                                hintText: AppString.country,
                                controller: fatherCountryController,
                                spacing: 20,
                                isBirthCertificateForm: true,
                                isPasswordFormField: false),
                          ),
                        ],
                      ),

                      // second row
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropDownFormField(
                              items: fatherOccupation,
                              value: fatherOccupationValue,
                              title: AppString.occupation,
                              onChanged: (p0) {
                                fatherOccupationValue = p0!;
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomDropDownFormField(
                              items: fatherReligion,
                              value: fatherReligionValue,
                              title: AppString.religon,
                              onChanged: (p0) {
                                fatherReligionValue = p0!;
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomDropDownFormField(
                              items: fatherMotherTounge,
                              value: fatherMotherToungeValue,
                              title: AppString.motherTounge,
                              onChanged: (p0) {
                                fatherMotherToungeValue = p0!;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),

                      //mother
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomDivider(
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        AppString.mother,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),

                      //mother
                      //First Row
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormFiled(
                                title: AppString.name,
                                hintText: AppString.name,
                                controller: motherNameController,
                                spacing: 20,
                                isBirthCertificateForm: true,
                                isPasswordFormField: false),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomTextFormFiled(
                              title: AppString.dob,
                              hintText: AppString.chooseDate,
                              controller: motherDOBController,
                              spacing: 20,
                              isPasswordFormField: false,
                              isreadOnly: true,
                              isBirthCertificateForm: true,
                              ontap: () async {
                                final date = await customDatePicker(context);
                                if (date == null) {
                                  return;
                                } else {
                                  motherDOBController.text =
                                      date.formatToNumericDate();
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomTextFormFiled(
                                title: AppString.country,
                                hintText: AppString.country,
                                controller: motherCountryController,
                                spacing: 20,
                                isBirthCertificateForm: true,
                                isPasswordFormField: false),
                          ),
                        ],
                      ),

                      // second row
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropDownFormField(
                              items: motherOccupation,
                              value: motherOccupationValue,
                              title: AppString.occupation,
                              onChanged: (p0) {
                                motherOccupationValue = p0!;
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomDropDownFormField(
                              items: motherReligion,
                              value: motherReligionValue,
                              title: AppString.religon,
                              onChanged: (p0) {
                                motherReligionValue = p0!;
                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: CustomDropDownFormField(
                              items: motherMotherTounge,
                              value: motherMotherToungeValue,
                              title: AppString.motherTounge,
                              onChanged: (p0) {
                                motherMotherToungeValue = p0!;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: SizedBox(
                          width: 400,
                          child: CustomButton(
                              title: "Create Birth Certificate",
                              color: Colors.deepPurpleAccent,
                              ontap: () {
                                // if (formKey.currentState!.validate()) {
                                //   BirthRegisterCreator().createPDF(context);
                                // }
                                BirthRegisterCreator().createPDF(context);
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
