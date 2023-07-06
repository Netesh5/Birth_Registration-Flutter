import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewer extends StatelessWidget {
  const PDFViewer({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    debugPrint("Url : $url");
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade200,
      ),
      body: SfPdfViewer.network(url),
    );
  }
}
