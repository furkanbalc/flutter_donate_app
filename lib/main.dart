import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_constants.dart';
import 'package:flutter_donate_app/core/theme/light_theme.dart';
import 'package:flutter_donate_app/core/config/firebase_options.dart';
import 'package:flutter_donate_app/presentation/view/authentication/user_info.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel_imp.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signin/signin_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signin/signin_viewmodel_imp.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signup/signup_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signup/signup_viewmodel_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: lightTheme,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      home: const UserInfoView(),
    );
  }
}

final signupViewModelImp = ChangeNotifierProvider<SignupViewModel>((ref) => SignupViewModelImp());
final signinViewModelImp = ChangeNotifierProvider<SigninViewModel>((ref) => SigninViewModelImp());
final personalInfoViewModelImp = ChangeNotifierProvider<PersonalInfoViewModel>((ref) => PersonalInfoViewModelImp());
