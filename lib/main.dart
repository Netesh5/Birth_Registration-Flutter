import 'package:birthregistration/core/resources/theme.dart';
import 'package:birthregistration/core/routes/routes_config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      //  routeInformationParser: AppRouter.routes().routeInformationParser,
      // routerDelegate: AppRouter.routes().routerDelegate,
      // routeInformationProvider: AppRouter.routes().routeInformationProvider,
      routerConfig: AppRouter.routes(),
    );
  }
}
