import 'package:birthregistration/core/common/snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? fullName;

class FirestoreService with ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  saveUserDetail(
      {required User user,
      required String fullname,
      required String email,
      required String password,
      required String location,
      required phone,
      required BuildContext context}) async {
    Map<String, dynamic> userDetail = {
      "fullname": fullname,
      "email": email,
      "password": password,
      "location": location,
      "phone": phone,
      "id": user.uid,
      "role": "user",
    };
    fullName = fullname;
    final userRef = firestore.collection("users").doc(user.uid);
    try {
      await userRef.set(userDetail);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("fullName", fullname);
    } on FirebaseException catch (e) {
      customSnackbar(context, e.message!);
    }
  }

  saveBirthDetail({
    required BuildContext context,
    required User user,
    required String firstname,
    required String middlename,
    required String lastname,
    required String dob,
    required String time,
    required String birthSite,
    required String gender,
    required String cast,
    required String birthType,
    required String weight,
    required String address,
    required String vdc,
    required String wardNo,
    required String fatherName,
    required String fatherDOB,
    required String fatherCountry,
    required String fatherOccupation,
    required String fatherReligion,
    required String fatherMotherTounge,
    required String motherName,
    required String motherDOB,
    required String motherCountry,
    required String motherOccupation,
    required String motherReligion,
    required String motherTounge,
  }) async {
    Map<String, dynamic> detail = {
      "firstname": firstname,
      "middlename": middlename,
      "lastname": lastname,
      "dob": dob,
      "time": time,
      "birthSite": birthSite,
      "gender": gender,
      "cast": cast,
      "birthType": birthType,
      "weight": weight,
      "address": address,
      "vdc": vdc,
      "wardNo": wardNo,
      "fatherName": fatherName,
      "fatherDOB": fatherDOB,
      "fatherCountry": fatherCountry,
      "fatherOccupation": fatherOccupation,
      "fatherReligion": fatherReligion,
      "fatherMotherTounge": fatherMotherTounge,
      "motherName": motherName,
      "motherDOB": motherDOB,
      "motherCountry": motherCountry,
      "motherOccupation": motherOccupation,
      "motherReligion": motherReligion,
      "motherTounge": motherTounge
    };
    debugPrint(fullName);
    final userRef = firestore
        .collection("users")
        .doc(user.uid)
        .collection("birthDetail")
        .doc("$firstname $lastname");

    try {
      await userRef.set(detail);
    } on FirebaseException catch (e) {
      customSnackbar(context, e.message!);
    }
  }
}
