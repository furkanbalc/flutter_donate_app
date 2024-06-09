import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/presentation/view/authentication/age_info.dart';
import 'package:flutter_donate_app/presentation/view/authentication/gender_info.dart';
import 'package:flutter_donate_app/presentation/view/authentication/signin.dart';
import 'package:flutter_donate_app/presentation/view/authentication/signup.dart';
import 'package:flutter_donate_app/presentation/view/authentication/user_info.dart';
import 'package:flutter_donate_app/presentation/view/base_app/app.dart';
import 'package:flutter_donate_app/presentation/view/home/home.dart';
import 'package:flutter_donate_app/presentation/view/profile/add_address.dart';
import 'package:flutter_donate_app/presentation/view/profile/address_infos.dart';
import 'package:flutter_donate_app/presentation/view/profile/profile.dart';
import 'package:flutter_donate_app/presentation/view/profile/profile_infos.dart';
import 'package:flutter_donate_app/presentation/view/splash/onboard.dart';
import 'package:flutter_donate_app/presentation/view/splash/splash.dart';
import 'package:flutter_donate_app/presentation/view/splash/welcome.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  AppRoutes._();

  static AppRoutes? _instance;

  static AppRoutes get instance => _instance ??= AppRoutes._();

  final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey(debugLabel: 'root');
  final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey(debugLabel: 'shell');

  final router = GoRouter(
    routes: [
      GoRoute(
        name: AppRouteName.splash.name,
        path: AppRouteName.splash.path,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: AppRouteName.welcome.name,
        path: AppRouteName.welcome.path,
        builder: (context, state) => const Welcome(),
      ),
      GoRoute(
        name: AppRouteName.onboard.name,
        path: AppRouteName.onboard.path,
        builder: (context, state) => const OnboardView(),
      ),
      GoRoute(
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
        name: AppRouteName.app.name,
        path: AppRouteName.app.path,
        builder: (context, state) => const App(),
        routes: [
          GoRoute(
            name: AppRouteName.profileInfos.name,
            path: AppRouteName.profileInfos.path,
            builder: (context, state) => const ProfileInfosView(),
          ),
          GoRoute(
            name: AppRouteName.addressInfos.name,
            path: AppRouteName.addressInfos.path,
            builder: (context, state) => const AddressInfos(),
            routes: [
              GoRoute(
                name: AppRouteName.addAddress.name,
                path: AppRouteName.addAddress.path,
                builder: (context, state) => const AddAddress(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: AppRouteName.home.name,
        path: AppRouteName.home.path,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        name: AppRouteName.profile.name,
        path: AppRouteName.profile.path,
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );
}
