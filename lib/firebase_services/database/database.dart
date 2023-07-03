import 'package:birthregistration/core/common/snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

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
    final userRef = firestore.collection("users").doc(user.uid);
    try {
      await userRef.set(userDetail);
    } on FirebaseException catch (e) {
      customSnackbar(context, e.message!);
    }
  }
}
