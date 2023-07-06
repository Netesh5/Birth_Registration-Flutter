// ignore_for_file: use_build_context_synchronously

import 'package:birthregistration/firebase_services/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class BirthRegisterCreator {
  final StorageServices storage = StorageServices();
  final PdfDocument document = PdfDocument();

  Future<List<int>> createPDF(context) async {
    final bytes = await _loadImageBytes('assets/images/nepal_logo.png');

    // Add the image to the PDF
    final image = PdfBitmap(bytes);
    document.pages
        .add()
        .graphics
        .drawImage(image, const Rect.fromLTWH(0, 0, 60, 60));
    // File('ImageToPDF.pdf').writeAsBytes(await document.save());
    return await document.save();
  }

  uploadPDF(BuildContext context) async {
    final pdfData = await createPDF(context);
    String downloadUrl = await storage.uploadFile(context, pdfData);
    return downloadUrl;
  }

  Future<Uint8List> _loadImageBytes(String imagePath) async {
    final data = await rootBundle.load(imagePath);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
