import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  late SplashViewModel splashViewModel;
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    super.initState();
    splashViewModel = ref.read(splashViewModelImp);
    profileViewModel = ref.read(profileViewModelImp);
    init();
  }

  init() async {
    splashViewModel.isLoggedIn();
    splashViewModel.getInitialScreen().then((value) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        /// onboard ekrani bir kere gorulduyse true doner ve
        if (splashViewModel.getInitialScreenResponse.data) {
          /// kullanıcı logiysa yani içerde kullanıcı varsa true döner
          if (splashViewModel.isLoggedInResponse.data != null) {
            /// uygulama başlar
            profileViewModel.getUserInfoFromFirestore(id: splashViewModel.isLoggedInResponse.data!).then((value) {
              context.goNamed(AppRouteName.home.name);
            });
          } else {
            /// kullanici login ekrani ile devam eder
            context.goNamed(AppRouteName.signin.name);
          }
        } else {
          /// onboard gorunmemis demektir onboarda atar
          context.goNamed(AppRouteName.onboard.name);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.electricViolet,
      body: _buildBody(context),
    );
  }

  /// Body
  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// App Logo
          _getAppLogo(context),

          /// Loading Circular
          const CustomCenteredProgressIndicator(),
        ],
      ),
    );
  }

  /// App Logo
  Widget _getAppLogo(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: CustomImageWidget(
        image: AppPng.appLogo.toPng,
        width: context.dynamicWidth(.5),
      ),
    );
  }
}
