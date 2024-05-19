import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  StorageService({required this.firebaseStorage});
  final FirebaseStorage firebaseStorage;

  storeFileToFirebase(String ref, var file) async {
    UploadTask? uploadTask;
    if (file is File) {
      uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    }
    if (file is Uint8List) {
      uploadTask = firebaseStorage.ref().child(ref).putData(file);
    }

    TaskSnapshot snapshot = await uploadTask!;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }
}
