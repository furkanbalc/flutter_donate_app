import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/domain/entities/address/address_entity.dart';
import 'package:flutter_donate_app/presentation/view/base_app/app.dart';
import 'package:flutter_donate_app/presentation/view/product/product_detail.dart';
import 'package:flutter_donate_app/presentation/view/user_info/age_info.dart';
import 'package:flutter_donate_app/presentation/view/user_info/gender_info.dart';
import 'package:flutter_donate_app/presentation/view/authentication/signin.dart';
import 'package:flutter_donate_app/presentation/view/authentication/signup.dart';
import 'package:flutter_donate_app/presentation/view/home/home.dart';
import 'package:flutter_donate_app/presentation/view/profile/about_app.dart';
import 'package:flutter_donate_app/presentation/view/profile/add_address.dart';
import 'package:flutter_donate_app/presentation/view/profile/address_detail.dart';
import 'package:flutter_donate_app/presentation/view/profile/address_info.dart';
import 'package:flutter_donate_app/presentation/view/profile/contact_us.dart';
import 'package:flutter_donate_app/presentation/view/profile/profile.dart';
import 'package:flutter_donate_app/presentation/view/profile/profile_info.dart';
import 'package:flutter_donate_app/presentation/view/splash/onboard.dart';
import 'package:flutter_donate_app/presentation/view/splash/splash.dart';
import 'package:flutter_donate_app/presentation/view/splash/welcome.dart';
import 'package:flutter_donate_app/presentation/view/user_info/user_info.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey(debugLabel: 'shell');

class AppRoutes {
  AppRoutes._();

  static AppRoutes? _instance;

  static AppRoutes get instance => _instance ??= AppRoutes._();

  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRouteName.splash.path,
    debugLogDiagnostics: true,
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
        builder: (context, state) {
          return const SigninView();
        },
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
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return App(child: child);
        },
        routes: [
          GoRoute(
            path: AppRouteName.home.path,
            name: AppRouteName.home.name,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeView();
            },
            routes: [
              GoRoute(
                path: AppRouteName.productDetail.path,
                name: AppRouteName.productDetail.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const ProductDetail();
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRouteName.categories.path,
            name: AppRouteName.categories.name,
            builder: (BuildContext context, GoRouterState state) {
              return const Center(child: Text('CATEGORIES'));
            },
          ),
          GoRoute(
            path: AppRouteName.favorites.path,
            name: AppRouteName.favorites.name,
            builder: (BuildContext context, GoRouterState state) {
              return const Center(child: Text('FAVORITES'));
            },
          ),
          GoRoute(
            path: AppRouteName.profile.path,
            name: AppRouteName.profile.name,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfileView();
            },
            routes: [
              GoRoute(
                path: AppRouteName.profileInfos.path,
                name: AppRouteName.profileInfos.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const ProfileInfoView();
                },
              ),
              GoRoute(
                path: AppRouteName.addressInfos.path,
                name: AppRouteName.addressInfos.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const AddressInfo();
                },
                routes: [
                  GoRoute(
                    path: AppRouteName.addAddress.path,
                    name: AppRouteName.addAddress.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (BuildContext context, GoRouterState state) {
                      return const AddAddress();
                    },
                  ),
                  GoRoute(
                    path: '${AppRouteName.addressDetail.path}/:index',
                    name: AppRouteName.addressDetail.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (BuildContext context, GoRouterState state) {
                      final address = state.extra as AddressEntity;
                      final index = int.parse(state.pathParameters['index']!);
                      return AddressDetail(address: address, index: index);
                    },
                  ),
                ],
              ),
              GoRoute(
                path: AppRouteName.contactUs.path,
                name: AppRouteName.contactUs.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const ContactUs();
                },
              ),
              GoRoute(
                path: AppRouteName.aboutApp.path,
                name: AppRouteName.aboutApp.name,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const AboutApp();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
