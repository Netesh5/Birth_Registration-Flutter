import 'package:birthregistration/features/admin/admin_profile.dart';
import 'package:birthregistration/features/homepage/homepage.dart';
import 'package:birthregistration/features/userprofile/user_profile.dart';
import 'package:birthregistration/shared_prefrences/shared_prefrences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    // return StreamBuilder(
    //     stream: FirebaseFirestore.instance
    //         .collection("users")
    //         .doc(user!.uid)
    //         .snapshots(),
    //     builder:
    //         (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //       if (snapshot.hasData && snapshot.data != null) {
    //         final users = snapshot.data!;
    //         if (users["role"] == "user") {
    //           return const UserProfile();
    //         } else {
    //           return const LoginScreen();
    //         }
    //       }
    //       return const HomeScreen();
    //     });

    return FutureBuilder(
        future: SharedPrefrencesService.gettoken(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, String?>? data = snapshot.data;
            if (data!["token"] != null) {
              return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .doc(user?.uid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      final users = snapshot.data!;
                      if (users["role"] == "user") {
                        return const UserProfile();
                      } else {
                        return const AdminProfile();
                      }
                    }
                    return const UserProfile();
                  });
              // return const UserProfile();
            } else {
              return const HomeScreen();
            }
          } else {
            return const HomeScreen();
          }
        });
  }
}
