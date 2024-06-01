import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_constants.dart';
import 'package:flutter_donate_app/core/theme/light_theme.dart';
import 'package:flutter_donate_app/core/config/firebase_options.dart';
import 'package:flutter_donate_app/presentation/view/authentication/signin.dart';
import 'package:flutter_donate_app/presentation/view/authentication/signup.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel_imp.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signin/signin_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signin/signin_viewmodel_imp.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signup/signup_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signup/signup_viewmodel_imp.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/profile_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/profile_viewmodel_imp.dart';
import 'package:flutter_donate_app/presentation/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/splash/splash_viewmodel_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_donate_app/core/router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox('settingsBox');
  di.initializeDependencies();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.electricViolet,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('tr')],
        fallbackLocale: const Locale('en'),
        useOnlyLangCode: true,
        useFallbackTranslations: true,
        path: "assets/lang",
        child: const ProviderScope(child: MyApp()),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: lightTheme,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      routerConfig: AppRoutes.instance.router,
    );
  }
}

final splashViewModelImp = ChangeNotifierProvider<SplashViewModel>((ref) => SplashViewModelImp());
final signupViewModelImp = ChangeNotifierProvider<SignupViewModel>((ref) => SignupViewModelImp());
final signinViewModelImp = ChangeNotifierProvider<SigninViewModel>((ref) => SigninViewModelImp());
final personalInfoViewModelImp = ChangeNotifierProvider<PersonalInfoViewModel>((ref) => PersonalInfoViewModelImp());
final profileViewModelImp = ChangeNotifierProvider<ProfileViewModel>((ref) => ProfileViewModelImp());
