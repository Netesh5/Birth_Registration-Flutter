import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class BirthRegisterCreator {
  final pdf = pw.Document();
  createPDF(BuildContext context) async {
    final logo = (await rootBundle.load('assets/images/nepal_logo.png'))
        .buffer
        .asUint8List();

    pdf.addPage(pw.Page(
      margin: const pw.EdgeInsets.only(left: 30, right: 35, top: 30),
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Column(children: [
          pw.Row(children: [
            pw.Container(
                decoration: pw.BoxDecoration(
                    image: pw.DecorationImage(image: pw.MemoryImage(logo))))
          ])
        ]);
      },
    ));
    await savePDF();
  }

  savePDF() async {
    Future<Uint8List> pdfInBytes = pdf.save();
    final blob = html.Blob([pdfInBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'pdf.pdf';
    html.document.body?.children.add(anchor);
  }
}
