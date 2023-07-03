import 'package:birthregistration/core/common/snack_bar.dart';
import 'package:birthregistration/core/routes/routes_constant.dart';
import 'package:birthregistration/firebase_services/database/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthService with ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirestoreService firestoreService = FirestoreService();
  User? user;
  Stream<User?> get authState {
    return firebaseAuth.authStateChanges();
  }

  registerUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String fullname,
      required String location,
      required String phone}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      // ignore: use_build_context_synchronously
      customSnackbar(context, "User Register Successfully. Login to continue");
      // ignore: use_build_context_synchronously
      context.pushReplacementNamed(RouteConstant.loginScreen);
      // ignore: use_build_context_synchronously
      await firestoreService.saveUserDetail(
          user: user!,
          fullname: fullname,
          email: email,
          password: password,
          location: location,
          phone: phone,
          context: context);
      return user;
    } on FirebaseAuthException catch (e) {
      customSnackbar(context, e.message!);
    }
    notifyListeners();
  }
}
