import 'package:birthregistration/core/resources/theme.dart';
import 'package:birthregistration/core/routes/routes_config.dart';
import 'package:birthregistration/firebase_services/authentication/auth.dart';
import 'package:birthregistration/firebase_services/database/database.dart';
import 'package:birthregistration/provider/loading_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => FirestoreService()),
        ChangeNotifierProvider(create: (context) => LoadingProvider()),
        StreamProvider<User?>.value(
          catchError: (_, __) => null,
          value: AuthService().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp.router(
        theme: AppTheme.themeData,
        debugShowCheckedModeBanner: false,
        //  routeInformationParser: AppRouter.routes().routeInformationParser,
        // routerDelegate: AppRouter.routes().routerDelegate,
        // routeInformationProvider: AppRouter.routes().routeInformationProvider,
        routerConfig: AppRouter.routes(context),
      ),
    );
  }
}
