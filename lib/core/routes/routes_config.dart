import 'package:birthregistration/core/routes/routes_constant.dart';
import 'package:birthregistration/features/errorpage/error_page.dart';
import 'package:birthregistration/features/homepage/homepage.dart';
import 'package:birthregistration/features/authentication/login/login_screen.dart';
import 'package:birthregistration/features/birth_registration/birth_registration_screen.dart';
import 'package:birthregistration/features/authentication/register/register.dart';
import 'package:birthregistration/features/pdfviewer.dart/pdfviewer.dart';
import 'package:birthregistration/features/userprofile/birth_detail.dart';
import 'package:birthregistration/features/userprofile/user_profile.dart';
import 'package:birthregistration/features/userprofile/user_profile_admin.dart';
import 'package:birthregistration/wrapper.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppRouter {
  static GoRouter routes(BuildContext context) {
    GoRouter router = GoRouter(
      //  initialLocation: "/",
      routes: [
        GoRoute(
          name: RouteConstant.homeScreen,
          path: "/home",
          pageBuilder: (context, state) {
            return const MaterialPage(child: HomeScreen());
          },
        ),
        GoRoute(
          name: RouteConstant.loginScreen,
          path: "/login",
          pageBuilder: (context, state) {
            return const MaterialPage(child: LoginScreen());
          },
        ),
        GoRoute(
          name: RouteConstant.birthRegistrationScreen,
          path: "/birth",
          pageBuilder: (context, state) {
            return const MaterialPage(child: BirthRegistrationScreen());
          },
        ),
        GoRoute(
          name: RouteConstant.registerScreen,
          path: "/regsiter",
          pageBuilder: (context, state) {
            return const MaterialPage(child: RegisterScreen());
          },
        ),
        GoRoute(
          name: RouteConstant.userProfileScreen,
          path: "/profile",
          pageBuilder: (context, state) {
            return const MaterialPage(child: UserProfile());
          },
        ),
        GoRoute(
          name: RouteConstant.wrapper,
          path: "/",
          pageBuilder: (context, state) {
            return const MaterialPage(child: Wrapper());
          },
        ),
        GoRoute(
          name: RouteConstant.birthDetail,
          path: "/birth/:name",
          pageBuilder: (context, state) {
            return MaterialPage(
                child: BirthDetail(
              name: state.pathParameters["name"]!,
            ));
          },
        ),
        GoRoute(
          name: RouteConstant.userProfileadmin,
          path: "/userprofileadmin/:username/:uid",
          pageBuilder: (context, state) {
            return MaterialPage(
                child: UserProfileAdmin(
              username: state.pathParameters["username"]!,
              uid: state.pathParameters["uid"]!,
            ));
          },
        ),
        GoRoute(
          name: RouteConstant.pdfviewer,
          path: "/pdfviewer/:url",
          pageBuilder: (context, state) {
            return MaterialPage(
                child: PDFViewer(url: state.pathParameters["url"]!));
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: ErrorPage());
      },
      // redirect: (context, state) async {
      //   SharedPreferences prefs = await SharedPreferences.getInstance();
      //   String? token = prefs.getString("token");
      //   if (token != null) {
      //     return "/profile";
      //   } else {
      //     return null;
      //   }
      // },
    );
    return router;
  }
}

Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  return token!;
}
