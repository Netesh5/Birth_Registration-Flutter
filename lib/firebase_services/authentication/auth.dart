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
      String errorMsg = getMessageFromErrorCode(e.code);
      customSnackbar(context, errorMsg);
    }
    notifyListeners();
  }

  loginUser(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      if (user != null) {
        // ignore: use_build_context_synchronously
        customSnackbar(context, "User logged in successfully");
        // ignore: use_build_context_synchronously
        context.pushReplacementNamed(RouteConstant.birthRegistrationScreen);
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      String errorMsg = getMessageFromErrorCode(e.code);
      customSnackbar(context, errorMsg);
    }
  }
}

String getMessageFromErrorCode(errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return "Email already used. Go to login page.";

    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong email/password combination.";

    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return "No user found with this email.";

    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return "User disabled.";

    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return "Too many requests to log into this account.";

    case "ERROR_OPERATION_NOT_ALLOWED":
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return "Email address is invalid.";

    default:
      return "Login failed. Please try again.";
  }
}
