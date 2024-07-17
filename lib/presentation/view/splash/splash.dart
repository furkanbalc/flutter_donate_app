import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/product/product_viewmodel.dart';
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
  late AddressViewModel addressViewModel;
  late ProductViewModel productViewModel;

  @override
  void initState() {
    super.initState();
    splashViewModel = ref.read(splashViewModelImp);
    profileViewModel = ref.read(profileViewModelImp);
    addressViewModel = ref.read(addressViewModelImp);
    productViewModel = ref.read(productViewModelImp);
    init();
  }

  Future<void> init() async {
    /// icerde kullanici var mi
    splashViewModel.isLoggedIn().then((value) async {
      /// kullanici varsa
      if (splashViewModel.isLoggedInResponse.data != null) {
        /// uygulama başlar
        await productViewModel.getCategories();
        await profileViewModel.getUserInfoFromFirestore(id: splashViewModel.isLoggedInResponse.data!);
        await addressViewModel.getAdressesFromFirestore(id: splashViewModel.isLoggedInResponse.data!);
        await addressViewModel.getProvinces();
        context.goNamed(AppRouteName.home.name);
        /// kullanici yoksa
      } else {
        /// on board ekranı gorundu mu
        splashViewModel.getInitialScreen().then((value) async {
          /// onboard ekrani bir kere gorulduyse true doner ve
          if (splashViewModel.getInitialScreenResponse.data) {
            /// kullanici welcome ekrani ile devam eder
            context.goNamed(AppRouteName.welcome.name);
          } else {
            /// onboard gorunmemis demektir onboarda atar
            context.goNamed(AppRouteName.onboard.name);
          }
        });
      }
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
