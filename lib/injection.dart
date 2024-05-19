import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_donate_app/core/service/firebase_storage_service.dart';
import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource_imp.dart';
import 'package:flutter_donate_app/data/repositories/auth_repository_imp.dart';
import 'package:flutter_donate_app/domain/repositories/auth_repository.dart';
import 'package:flutter_donate_app/domain/usecases/auth_usecases.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

reset() {
  injector.reset();
}

void initializeDependencies() async {
  // Firebase Auth
  injector.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  // Firebase Cloud Firestore
  injector.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  // Firebase Storage
  injector.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
  // Storage Service
  injector.registerLazySingleton<StorageService>(() => StorageService(firebaseStorage: injector()));

  // Remote
  injector.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(
        firebaseAuth: injector(),
        firebaseFirestore: injector(),
        firebaseStorage: injector(),
        storageService: injector(),
      ));

  // Repository
  injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(remoteDataSource: injector()));

  // UseCases
  injector.registerLazySingleton<SignUp>(() => SignUp(authRepository: injector()));
  injector.registerLazySingleton<SignIn>(() => SignIn(authRepository: injector()));
  injector.registerLazySingleton<SaveUserInfoToFirestore>(() => SaveUserInfoToFirestore(authRepository: injector()));
}
