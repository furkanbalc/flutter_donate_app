import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_donate_app/core/service/firebase_storage_service.dart';
import 'package:flutter_donate_app/data/datasource/local_datasource/local_datasource.dart';
import 'package:flutter_donate_app/data/datasource/local_datasource/local_datasource_imp.dart';
import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource_imp.dart';
import 'package:flutter_donate_app/data/repositories/address_repository.dart';
import 'package:flutter_donate_app/data/repositories/auth_repository_imp.dart';
import 'package:flutter_donate_app/data/repositories/profile_repository_imp.dart';
import 'package:flutter_donate_app/data/repositories/splash_repository_imp.dart';
import 'package:flutter_donate_app/domain/repositories/address_repository.dart';
import 'package:flutter_donate_app/domain/repositories/auth_repository.dart';
import 'package:flutter_donate_app/domain/repositories/profile_repository.dart';
import 'package:flutter_donate_app/domain/repositories/splash_repository.dart';
import 'package:flutter_donate_app/domain/usecases/address_usecase.dart';
import 'package:flutter_donate_app/domain/usecases/auth_usecases.dart';
import 'package:flutter_donate_app/domain/usecases/profile_usecases.dart';
import 'package:hive_flutter/hive_flutter.dart' as hive;
import 'package:flutter_donate_app/domain/usecases/splash_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

reset() {
  injector.reset();
}

void initializeDependencies() async {
  // hive
  injector.registerLazySingleton(() => hive.Hive.box('settingsBox'));
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

  // local
  injector.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImp(box: injector()));

  // Repository
  injector.registerLazySingleton<SplashRepository>(() => SplashRepositoryImp(
        localDataSource: injector(),
        remoteDataSource: injector(),
      ));
  injector.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(remoteDataSource: injector()));
  injector.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImp(remoteDataSource: injector()));
  injector.registerLazySingleton<AddressRepository>(() => AddressRepositoryImp(
        remoteDataSource: injector(),
      ));

  // UseCases
  injector.registerLazySingleton<IsLoggedIn>(() => IsLoggedIn(splashRepository: injector()));
  injector.registerLazySingleton<GetInitialScreen>(() => GetInitialScreen(splashRepository: injector()));
  injector.registerLazySingleton<SetInitialScreen>(() => SetInitialScreen(splashRepository: injector()));
  injector.registerLazySingleton<SignUp>(() => SignUp(authRepository: injector()));
  injector.registerLazySingleton<SignIn>(() => SignIn(authRepository: injector()));
  injector.registerLazySingleton<SignOut>(() => SignOut(authRepository: injector()));
  injector.registerLazySingleton<DeleteAccount>(() => DeleteAccount(authRepository: injector()));
  injector.registerLazySingleton<SaveUserInfoToFirestore>(() => SaveUserInfoToFirestore(profileRepository: injector()));
  injector
      .registerLazySingleton<GetUserInfoFromFirestore>(() => GetUserInfoFromFirestore(profileRepository: injector()));
  injector.registerLazySingleton<UpdateProfileUser>(() => UpdateProfileUser(profileRepository: injector()));
  injector.registerLazySingleton<GetAddressInfo>(() => GetAddressInfo(addressRepository: injector()));
  injector.registerLazySingleton<RemoveAddress>(() => RemoveAddress(addressRepository: injector()));
  injector.registerLazySingleton<AddAddressToFirestore>(() => AddAddressToFirestore(addressRepository: injector()));
  injector.registerLazySingleton<GetTrProvinces>(() => GetTrProvinces(addressRepository: injector()));
}
