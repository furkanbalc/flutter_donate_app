import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/viewmodel/splash/splash_viewmodel.dart';
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

  @override
  void initState() {
    super.initState();
    splashViewModel = ref.read(splashViewModelImp);
    init();
  }

  init() async {
    splashViewModel.getInitialScreen().then((value) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        /// onboard ekrani bir kere gorulduyse true doner ve
        if (splashViewModel.getInitialScreenResponse.data) {
          /// kullanici login ekrani ile devam eder
          context.goNamed(AppRouteName.signin.name);
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// App Logo
            _getAppLogo(context),

            /// Loading Circular
            const CustomCenteredProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _getAppLogo(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: CustomImageWidget(
        image: AppAssets.appLogo.toPng,
        width: context.dynamicWidth(.5),
      ),
    );
  }
}
