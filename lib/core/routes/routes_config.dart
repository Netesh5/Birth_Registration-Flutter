import 'package:birthregistration/core/routes/routes_constant.dart';
import 'package:birthregistration/features/errorpage/error_page.dart';
import 'package:birthregistration/features/homepage/homepage.dart';
import 'package:birthregistration/features/login/login_screen.dart';
import 'package:birthregistration/features/registration/birth_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter routes() {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: RouteConstant.homeScreen,
          path: "/",
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
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: ErrorPage());
      },
    );
    return router;
  }
}
