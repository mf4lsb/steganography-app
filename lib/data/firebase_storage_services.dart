import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


class FirebaseStorageServices {
  static FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  static Future<String> uploadImage(String uid, String imagePath) async {
  Reference reference = _firebaseStorage.ref(uid);

  try {
    await reference.putFile(File(imagePath));

    final ImageUrl = await reference.getDownloadURL();

    return ImageUrl;
  } catch(e) {
    debugPrint(e.toString());
    return '';
  }
  }
}