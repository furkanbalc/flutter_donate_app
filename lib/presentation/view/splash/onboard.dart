import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/splash/widgets/custom_clip_path_container.dart';
import 'package:flutter_donate_app/presentation/view/splash/widgets/custom_tab_page_selector.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_icon_button.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_text_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_image_widget.dart';

class OnboardView extends ConsumerStatefulWidget {
  const OnboardView({super.key});

  @override
  ConsumerState createState() => _OnboardViewState();
}

class _OnboardViewState extends ConsumerState<OnboardView> {
  late SplashViewModel splashViewModel;

  @override
  void initState() {
    splashViewModel = ref.read(splashViewModelImp);
    splashViewModel.setInitialScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    splashViewModel = ref.watch(splashViewModelImp);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparentColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.cascadingWhite,
      body: SafeArea(
        child: Stack(
          children: [
            _skipButton(),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: CustomImageWidget(
                image: AppAssets.phone.toPng,
                height: context.dynamicHeight(.6),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: context.paddings.onlyBottomUltra,
              child: Center(
                child: CustomImageWidget(
                  image: AppAssets.ellips.toPng,
                  color: AppColors.electricViolet,
                ),
              ),
            ),
            /// Onbard Bottom Widget
            const Align(
              alignment: Alignment.bottomCenter,
              child: CustomClipPathContainer(
                title: 'Şöyle bir odana bak ',
                subTitle: 'Fazladan kullanmadığın ne var ?',
                desc:
                    'Ne kadar kullanmadğın eşya varsa hemen resmini çek ve ilan oluştur, başkası için önemli olabilir',
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// SKIP BUTTON
  Widget _skipButton() {
    return Positioned(
      right: 10,
      top: 10,
      child: CustomTextButton(
        onPressed: () {},
        text: 'Geç',
      ),
    );
  }
}
