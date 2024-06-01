import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_donate_app/core/enums/firebase_collections.dart';
import 'package:flutter_donate_app/core/service/firebase_storage_service.dart';
import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/data/models/user_model.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  RemoteDataSourceImp({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.firebaseStorage,
    required this.storageService,
  });

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;
  final StorageService storageService;

   UserCredential? userCredential;

  /// -- SIGN UP --
  @override
  Future<void> signUp({required String email, required String password}) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  /// -- SIGN IN --
  @override
  Future<String> signIn({required String email, required String password}) async {
    userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential!.user!.uid;
  }

  /// -- SIGN OUT --
  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
    userCredential = null;
  }

  /// -- SAVE USER INFO --
  @override
  Future<UserModel> saveUserInfoToFirestore({
    required String name,
    required String surname,
    required String phoneNumber,
    required String age,
    required String gender,
    required dynamic profileImage,
  }) async {
    User? currentUser = firebaseAuth.currentUser;

    /// -- profile image upload firebase storage
    String profileImageUrl = profileImage is String ? profileImage : '';
    if (profileImage != null && profileImage is! String) {
      profileImageUrl = await storageService.storeFileToFirebase(
        ref: 'profileImage/${currentUser!.uid}',
        file: profileImage,
      );
    }
    Map<String, dynamic> user = {
      "data": {
        "id": currentUser?.uid ?? 'invalid_id', //randomId
        "fullName": {
          "name": name.trim(),
          "surname": surname.trim(),
        },
        "adress": {
          "city": null,
          "country": null,
          "desc": null,
          "location": {"lang": null, "lat": null},
          "town": null,
        },
        "email": currentUser?.email?.trim() ?? 'invalid_email',
        "phoneNumber": phoneNumber,
        "gender": gender,
        "age": age,
        "profileImgUrl": profileImageUrl,
      },
      "isActive": false,
      "isAdmin": false,
    };

    await firebaseFirestore.collection(FirebaseCollections.users.name).doc(currentUser?.uid).set(user);
    return UserModel.fromJson(user);
  }

  /// -- GET CURRENT USER INFO --
  @override
  Future<UserModel> getUserInfoFromFirestore({
    required String id,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> userModelSnapshot =
        await firebaseFirestore.collection(FirebaseCollections.users.name).doc(id).get();
    return UserModel.fromJson(userModelSnapshot.data());
  }
}
