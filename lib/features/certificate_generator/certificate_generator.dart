// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'dart:html' as html;
import 'package:birthregistration/firebase_services/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class BirthRegisterCreator {
  final StorageServices storage = StorageServices();
  final PdfDocument document = PdfDocument();
  // final pdf = pw.Document();
  // Future<Uint8List> createPDF(BuildContext context) async {
  //   final logo = (await rootBundle.load('assets/images/nepal_logo.png'))
  //       .buffer
  //       .asUint8List();

  //   pdf.addPage(pw.Page(
  //     margin: const pw.EdgeInsets.only(left: 30, right: 35, top: 30),
  //     pageFormat: PdfPageFormat.a4,
  //     build: (context) {
  //       return pw.Column(children: [
  //         pw.Row(children: [
  //           pw.Container(
  //               // decoration: pw.BoxDecoration(
  //               //     image: pw.DecorationImage(image: pw.MemoryImage(logo)))
  //               )
  //         ])
  //       ]);
  //     },
  //   ));
  // Uint8List pdfBytes = await pdf.save();
  // // await savePDF();
  // String downloadUrl = await storage.uploadFile(context, pdfBytes);
  // debugPrint("Download URL : $downloadUrl");
  //return pdf.save();

  Future<List<int>> createPDF(context) async {
    // final Uint8List logo = html.File(
    //   'assets/images/nepal_logo.png',
    // );
    // final PdfBitmap image = PdfBitmap.fromBase64String(logo);
    final bytes = await _loadImageBytes(
        'assets/images/nepal_logo.png'); // Replace with your image file path

    // Add the image to the PDF
    final image = PdfBitmap(bytes);
    document.pages
        .add()
        .graphics
        .drawImage(image, const Rect.fromLTWH(0, 0, 500, 200));
    // File('ImageToPDF.pdf').writeAsBytes(await document.save());
    return await document.save();
  }

  uploadPDF(BuildContext context) async {
    final pdfData = await createPDF(context);
    await storage.uploadFile(context, pdfData);
  }

  Future<Uint8List> _loadImageBytes(String imagePath) async {
    final data = await rootBundle.load(imagePath);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
  // savePDF() async {
  //   html.AnchorElement anchor;
  //   Uint8List pdfInBytes = await pdf.save();
  //   final blob = html.Blob([pdfInBytes], 'application/pdf');
  //   final url = html.Url.createObjectUrlFromBlob(blob);
  //   anchor = html.document.createElement('a') as html.AnchorElement
  //     ..href = url
  //     ..style.display = 'none'
  //     ..download = 'birthcertificate.pdf';
  //   html.document.body?.children.add(anchor);
  // }
}
