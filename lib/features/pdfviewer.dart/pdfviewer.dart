import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class PDFViewer extends StatelessWidget {
  const PDFViewer({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
        actions: [
          TextButton.icon(
              onPressed: () {
                html.window.open(url, "_blank");
              },
              icon: const Icon(
                Icons.download,
                color: Colors.black,
              ),
              label: const Text(
                "Download",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: SfPdfViewer.network(
        url,
        enableDocumentLinkAnnotation: false,
      ),
    );
  }
}
