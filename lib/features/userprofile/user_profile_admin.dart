import 'package:birthregistration/core/common/circular_progress_indicator.dart';
import 'package:birthregistration/core/constants/app_string.dart';
import 'package:birthregistration/core/routes/routes_constant.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UserProfileAdmin extends StatelessWidget {
  const UserProfileAdmin(
      {super.key, required this.username, required this.uid});
  final String username;
  final String uid;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "$username ${AppString.userProfile}",
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                    .doc(uid)
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
      ),
    );
  }
}
