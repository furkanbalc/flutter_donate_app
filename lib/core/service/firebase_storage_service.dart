import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  StorageService({required this.firebaseStorage});
  final FirebaseStorage firebaseStorage;

  Future<String> storeFileToFirebase(
      {required String ref, required var file}) async {
    UploadTask? uploadTask;
    if (file is XFile) {
      uploadTask = firebaseStorage.ref().child(ref).putFile(File(file.path));
    }
    TaskSnapshot snapshot = await uploadTask!;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }
}
