import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/presentation/splash/splash.dart';
import 'package:flutter_donate_app/presentation/view/app/home.dart';
import 'package:flutter_donate_app/presentation/view/authentication/age_info.dart';
import 'package:flutter_donate_app/presentation/view/authentication/gender_info.dart';
import 'package:flutter_donate_app/presentation/view/authentication/signin.dart';
import 'package:flutter_donate_app/presentation/view/authentication/signup.dart';
import 'package:flutter_donate_app/presentation/view/authentication/user_info.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  AppRoutes._();

  static AppRoutes? _instance;

  static AppRoutes get instance => _instance ??= AppRoutes._();

  final router = GoRouter(
    routes: [
      GoRoute(
        name: AppRouteName.splash.name,
        path: AppRouteName.splash.path,
        builder: (context, state) => const SplashView(),
      ),      GoRoute(
        name: AppRouteName.signin.name,
        path: AppRouteName.signin.path,
        builder: (context, state) => const SigninView(),
      ),
      GoRoute(
        name: AppRouteName.signup.name,
        path: AppRouteName.signup.path,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        name: AppRouteName.userInfo.name,
        path: AppRouteName.userInfo.path,
        builder: (context, state) => const UserInfoView(),
      ),
      GoRoute(
        name: AppRouteName.genderInfo.name,
        path: AppRouteName.genderInfo.path,
        builder: (context, state) => const GenderInfoView(),
      ),
      GoRoute(
        name: AppRouteName.ageInfo.name,
        path: AppRouteName.ageInfo.path,
        builder: (context, state) => const AgeInfoView(),
      ),
      GoRoute(
        name: AppRouteName.home.name,
        path: AppRouteName.home.path,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
