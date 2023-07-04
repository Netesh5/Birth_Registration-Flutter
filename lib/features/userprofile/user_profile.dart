import 'package:birthregistration/core/common/circular_progress_indicator.dart';
import 'package:birthregistration/core/constants/app_string.dart';
import 'package:birthregistration/core/routes/routes_constant.dart';
import 'package:birthregistration/firebase_services/authentication/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // debugPrint("FullName : ${SharedPrefrencesService.data?["fullName"]}");
    final user = Provider.of<User?>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          AppString.userProfile,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey.shade200,
        actions: [
          TextButton.icon(
              onPressed: () async {
                await AuthService().logout(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              label: const Text(
                "Logout",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.pushNamed(
              RouteConstant.birthRegistrationScreen,
            );
          },
          label: const Text("New Registration")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total Registration ",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(user?.uid)
                  .collection("birthDetail")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomCircularProgressIndicator();
                } else if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text("No data available"),
                  );
                } else if (snapshot.hasData && snapshot.data != null) {
                  final data = snapshot.data!.docs;
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: ListTile(
                          title: Text("${index + 1}   ${data[index].id}"),
                          trailing:
                              const Icon(Icons.arrow_forward_ios_outlined),
                          onTap: () {
                            context.pushNamed(RouteConstant.birthDetail,
                                pathParameters: {"name": data[index].id});
                          },
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("No data avaialble"),
                  );
                }
                return const Center(
                  child: Text("No data avaialble"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
