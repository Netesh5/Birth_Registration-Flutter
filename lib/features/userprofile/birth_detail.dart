import 'package:birthregistration/core/common/divider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BirthDetail extends StatelessWidget {
  const BirthDetail({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "$name Birth Detail",
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey.shade200,
        actions: [
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.picture_as_pdf,
                color: Colors.black,
              ),
              label: const Text(
                "View Birth Certificate",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200),
          child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection("users")
                  .doc(user?.uid)
                  .collection("birthDetail")
                  .doc(name)
                  .get(),
              builder: (context, snapshot) {
                DocumentSnapshot<Map<String, dynamic>>? data = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomDivider(color: Colors.grey),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Child Information",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomDivider(color: Colors.grey),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "First Name : "),
                            TextSpan(
                                text: "${data?["firstname"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Middle Name : "),
                            TextSpan(
                                text: "${data?["middlename"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Last Name : "),
                            TextSpan(
                                text: "${data?["lastname"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ]))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Date of Birth : "),
                            TextSpan(
                                text: "${data?["dob"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Time : "),
                            TextSpan(
                                text: "${data?["time"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Birth Site : "),
                            TextSpan(
                                text: "${data?["birthSite"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ]))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Cast : "),
                            TextSpan(
                                text: "${data?["cast"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Birth Type : "),
                            TextSpan(
                                text: "${data?["birthType"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Weight : "),
                            TextSpan(
                                text: "${data?["weight"]} kg",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ]))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Address : "),
                            TextSpan(
                                text: "${data?["address"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "VCD/Muncipality : "),
                            TextSpan(
                                text: "${data?["vdc"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Ward No : "),
                            TextSpan(
                                text: "${data?["wardNo"]} ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ]))
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const CustomDivider(color: Colors.grey),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Parent Information",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomDivider(color: Colors.grey),
                      const SizedBox(
                        height: 40,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Father Name : "),
                            TextSpan(
                                text: "${data?["fatherName"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Date of Birth : "),
                            TextSpan(
                                text: "${data?["fatherDOB"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Country : "),
                            TextSpan(
                                text: "${data?["fatherCountry"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ]))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Occupation : "),
                            TextSpan(
                                text: "${data?["fatherOccupation"]} ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Religion : "),
                            TextSpan(
                                text: "${data?["fatherReligion"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Mother Tounge : "),
                            TextSpan(
                                text: "${data?["fatherMotherTounge"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomDivider(color: Colors.grey),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Mother Name : "),
                            TextSpan(
                                text: "${data?["motherName"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Date of Birth : "),
                            TextSpan(
                                text: "${data?["motherDOB"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Country : "),
                            TextSpan(
                                text: "${data?["motherCountry"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ]))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Occupation : "),
                            TextSpan(
                                text: "${data?["motherOccupation"]} ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Religion : "),
                            TextSpan(
                                text: "${data?["motherReligion"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(text: "Mother Tounge : "),
                            TextSpan(
                                text: "${data?["motherTounge"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent)),
                          ])),
                        ],
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
