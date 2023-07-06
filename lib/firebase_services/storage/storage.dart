import 'dart:typed_data';

import 'package:birthregistration/core/common/snack_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageServices {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadFile(BuildContext context, List<int> file) async {
    try {
      Reference storageReference = firebaseStorage
          .refFromURL("gs://birthregistration-b7691.appspot.com/")
          .child(
              "pdf/birthCertificate-${DateTime.now().microsecondsSinceEpoch}.pdf");

      //Uploading file
      UploadTask uploadTask = storageReference.putData(
        Uint8List.fromList(file),
      );

      //Getting Download link
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      debugPrint("Download URL : $downloadUrl");
      return downloadUrl;
    } on Exception catch (e) {
      customSnackbar(context, e.toString());
      return "";
    }
  }

  // void displayPdf(String downloadUrl) {
  //   final anchor = html.AnchorElement(href: downloadUrl);
  //   anchor.target = '_blank';
  //   anchor.download = 'example.pdf';
  //   anchor.click();
  // }
}
