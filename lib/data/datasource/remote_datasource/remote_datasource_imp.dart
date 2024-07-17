import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_donate_app/core/constants/app_constants.dart';
import 'package:flutter_donate_app/core/enums/firebase_collections.dart';
import 'package:flutter_donate_app/core/service/firebase_storage_service.dart';
import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/data/models/address/address_model.dart';
import 'package:flutter_donate_app/data/models/address/get_province_model.dart';
import 'package:flutter_donate_app/data/models/categories_model.dart';
import 'package:flutter_donate_app/data/models/user_model.dart';
import 'package:flutter_donate_app/domain/entity/address/address_entity.dart';
import 'package:http/http.dart' as http;

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

  /// -- IS USER LOGGED IN --
  @override
  Future<String?> isUserLoggedIn() async {
    final user = firebaseAuth.currentUser;
    return user?.uid;
  }

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

  /// -- DELETE ACCOUNT --
  @override
  Future<void> deleteUserAccount() async {
    await firebaseAuth.currentUser!.delete();
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
        "email": currentUser?.email?.trim() ?? 'invalid_email',
        "phoneNumber": phoneNumber,
        "gender": gender,
        "age": age,
        "profileImgUrl": profileImageUrl,
      },
      "isActive": true,
      "isAdmin": false,
    };

    await firebaseFirestore.collection(FirebaseCollections.users.name).doc(currentUser?.uid).set(user);
    return UserModel.fromJson(user);
  }

  /// -- GET USER INFO --
  @override
  Future<UserModel> getUserInfoFromFirestore({
    required String id,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> userModelSnapshot =
        await firebaseFirestore.collection(FirebaseCollections.users.name).doc(id).get();
    return UserModel.fromJson(userModelSnapshot.data());
  }

  /// -- UPDATE USER INFO --
  @override
  Future<void> updateUserInfo({
    required String id,
    required String name,
    required String surname,
    required String email,
    required String phoneNumber,
    required String gender,
    required String age,
    required dynamic profileImage,
  }) async {
    /// -- profile image upload firebase storage
    String profileImageUrl = profileImage is String ? profileImage : '';
    if (profileImage != null && profileImage is! String) {
      profileImageUrl = await storageService.storeFileToFirebase(
        ref: 'profileImage/$id',
        file: profileImage,
      );
    }

    Map<String, dynamic> user = {
      "data": {
        "id": id,
        "fullName": {
          "name": name,
          "surname": surname,
        },
        "email": email.trim(),
        "phoneNumber": phoneNumber,
        "gender": gender,
        "age": age,
        "profileImgUrl": profileImageUrl,
      },
    };

    await firebaseFirestore.collection(FirebaseCollections.users.name).doc(id).update(user);
  }

  /// -- GET USER ADDRESS INFO --
  @override
  Future<AddressesModel> getAdressesFromFirestore({
    required String id,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> addressModel =
        await firebaseFirestore.collection(FirebaseCollections.addresses.name).doc(id).get();
    return AddressesModel.fromJson(addressModel.data());
  }

  /// -- ADD ADDRESS INFO --
  @override
  Future<AddressesModel> addAddressInfoToFirestore({
    required String country,
    required String city,
    required String town,
    required String desc,
    required String lat,
    required String long,
  }) async {
    User? currentUser = firebaseAuth.currentUser;

    Map<String, dynamic> address = {
      "country": country,
      "city": city,
      "county": town,
      "desc": desc,
      "geo": {
        "lat": lat,
        "long": long,
      },
    };

    await firebaseFirestore.collection(FirebaseCollections.addresses.name).doc(currentUser?.uid).update({
      FirebaseCollections.addresses.name: FieldValue.arrayUnion([address]),
    });
    return AddressesModel.fromJson(address);
  }

  /// -- UPDATE ADDRESS --
  @override
  Future<void> updateAddressAtIndex(AddressEntity addressEntity, int index) async {
    User? currentUser = firebaseAuth.currentUser;

    DocumentSnapshot<Map<String, dynamic>> docSnapshot =
        await firebaseFirestore.collection(FirebaseCollections.addresses.name).doc(currentUser?.uid).get();
    if (docSnapshot.exists) {
      var addresses = docSnapshot.data()!['addresses'];
      addresses[index] = addressEntity;
      await firebaseFirestore
          .collection(FirebaseCollections.addresses.name)
          .doc(currentUser?.uid)
          .update({'addresses': addresses});
    }
  }

  /// -- REMOVE ADDRES --
  @override
  Future<void> removeAddressesByIndex(List<dynamic> addresses) async {
    User? currentUser = firebaseAuth.currentUser;
    await firebaseFirestore
        .collection(FirebaseCollections.addresses.name)
        .doc(currentUser?.uid)
        .update({FirebaseCollections.addresses.name: addresses}).then((value) => getAdressesFromFirestore(id: currentUser!.uid));
  }

  /// -- GET TURKEY PROVINCES -- ///FIXME
  @override
  Future<GetProvinceModel> getTrProvinces() async {
    final url = Uri.parse(AppConstants.getProvinceEndPoint);
    dynamic data;
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        data = json.decode(response.body);
      }
    } catch (e) {}
    return GetProvinceModel.fromJson(data);
  }

  /// -- GET CATEGORIES --
  @override
  Future<CategoriesModel> getCategories() async {
    QuerySnapshot<Map<String, dynamic>> categoriesSnapshot = await firebaseFirestore
        .collection('categories')
        .get();

    return CategoriesModel.fromSnapshot(categoriesSnapshot);
  }
}
