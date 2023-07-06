// ignore_for_file: use_build_context_synchronously

import 'package:birthregistration/core/extension/date_time.dart';
import 'package:birthregistration/firebase_services/storage/storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';

class BirthRegisterCreator {
  final StorageServices storage = StorageServices();

  final pdf = pw.Document();

  createPDF(BuildContext context, String fullName) async {
    final user = Provider.of<User?>(context, listen: false);
    final logo = (await rootBundle.load('assets/images/nepal_logo.png'))
        .buffer
        .asUint8List();
    final String dateNow = DateTime.now().formatToNumericDate();

    final userRef = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("birthDetail")
        .doc(fullName)
        .get();
    final data = userRef.data();
    debugPrint("${data.toString()},$fullName,${user.uid}");
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(children: [
                  pw.Image(pw.MemoryImage(logo), width: 80, height: 80),
                  pw.SizedBox(width: 50),
                  pw.Column(children: [
                    pw.Text("Government of Nepal",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("Office of Local Register",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("Kathmandu Municipality",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("Kathmandu District, Province-3, Nepal",
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ])
                ]),
                pw.SizedBox(height: 30),
                pw.Center(
                  child: pw.Text("Birth Registration Certificate",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 18)),
                ),
                pw.SizedBox(height: 5),
                pw.Divider(),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [pw.Text("Registration Date : $dateNow")],
                ),
                pw.SizedBox(height: 10),
                pw.Table(border: pw.TableBorder.all(), children: [
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text(
                            "Full Name : ${data?["firstname"]} ${data?["middlename"]} ${data?["lastname"]}"))
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text("Date of Birth : ${data?["dob"]} "))
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text("Time of Birth : ${data?["time"]} "))
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text("Sex : ${data?["gender"]} "))
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child:
                            pw.Text("Permanent Address : ${data?["address"]} "))
                  ]),
                  pw.TableRow(children: [
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(5),
                              child: pw.Text(
                                  "Birth Type : ${data?["birthType"]}")),
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(5),
                              child: pw.Text(
                                  "Birth Site : ${data?["birthSite"]}")),
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(5),
                              child: pw.Text("Weight : ${data?["weight"]}"))
                        ])
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text("Father Name : ${data?["fatherName"]} "))
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text(
                            "Father Address : ${data?["fatherCountry"]} "))
                  ]),
                  pw.TableRow(children: [
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(5),
                              child: pw.Text(
                                  "Father Mother Tounge : ${data?["fatherMotherTounge"]}")),
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(5),
                              child: pw.Text(
                                  "Father Religion : ${data?["fatherReligion"]}")),
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(5),
                              child: pw.Text(
                                  "Birth Occupation : ${data?["fatherOccupation"]}")),
                        ])
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text("Mother Name : ${data?["motherName"]} "))
                  ]),
                  pw.TableRow(children: [
                    pw.Padding(
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text(
                            "Mother Address : ${data?["motherCountry"]} "))
                  ]),
                  pw.TableRow(children: [
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(5),
                              child: pw.Text(
                                  " Mother Tounge : ${data?["motherTounge"]}")),
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(5),
                              child: pw.Text(
                                  "Mother Religion : ${data?["motherReligion"]}")),
                          pw.Padding(
                              padding: const pw.EdgeInsets.all(5),
                              child: pw.Text(
                                  "Mother Occupation : ${data?["motherOccupation"]}")),
                        ])
                  ]),
                ]),
                pw.SizedBox(height: 50),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(children: [
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(
                                "Name of Issuer : ${"................"} ")),
                        pw.SizedBox(height: 20),
                        pw.Padding(
                            padding: const pw.EdgeInsets.all(5),
                            child: pw.Text(
                                "Signature of Issuer : ${"................"} ")),
                      ]),
                      pw.Column(children: [
                        pw.Table(border: pw.TableBorder.all(), children: [
                          pw.TableRow(children: [
                            pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 50)),
                          ])
                        ]),
                        pw.SizedBox(height: 10),
                        pw.Text("Office Stamp")
                      ]),
                    ]),
              ]);
          // Center
        }));

    return pdf.save();
  }

  uploadPDF(BuildContext context, String fullName) async {
    final pdfData = await createPDF(context, fullName);
    String downloadUrl = await storage.uploadFile(context, pdfData);
    return downloadUrl;
  }

  Future<Uint8List> _loadImageBytes(String imagePath) async {
    final data = await rootBundle.load(imagePath);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
