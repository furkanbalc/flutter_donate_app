import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/data/models/on_board_model.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/splash/widgets/custom_clip_path_container.dart';
import 'package:flutter_donate_app/presentation/view/splash/widgets/custom_tab_page_selector.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_icon_button.dart';
import 'package:flutter_donate_app/presentation/widgets/button/custom_text_button.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/presentation/viewmodel/splash/splash_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/image/custom_image_widget.dart';
import 'package:go_router/go_router.dart';

part 'widgets/onboard_widget.dart';

class OnboardView extends ConsumerStatefulWidget {
  const OnboardView({super.key});

  @override
  ConsumerState createState() => _OnboardViewState();
}

class _OnboardViewState extends ConsumerState<OnboardView> {
  late SplashViewModel splashViewModel;

  @override
  void initState() {
    super.initState();
    splashViewModel = ref.read(splashViewModelImp);
    splashViewModel.setInitialScreen();
  }

  @override
  Widget build(BuildContext context) {
    splashViewModel = ref.watch(splashViewModelImp);
    return Scaffold(
      backgroundColor: AppColors.cascadingWhite,
      body: SafeArea(child: _buildBody(context)),
    );
  }

  /// Body
  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: context.dynamicWidth(),
            height: context.dynamicWidth(),
            decoration: BoxDecoration(
              color: AppColors.electricViolet.withOpacity(.1),
              shape: BoxShape.circle,
            ),
          ),
        ),
        PageView(
          controller: splashViewModel.pageController,
          onPageChanged: splashViewModel.onPageChanged,
          children: List.generate(
            splashViewModel.pages.length,
            (index) => _OnboardWidget(
              onBoardingModel: splashViewModel.pages[index],
              splashViewModel: splashViewModel,
            ),
          ),
        ),
        _skipButton(),
        _getNavigationWidget(),
      ],
    );
  }

  /// SKIP BUTTON
  Widget _skipButton() {
    return Positioned(
      right: AppSizes.low.value,
      top: AppSizes.low.value,
      child: CustomTextButton(
        onPressed: () => splashViewModel.animateToLastPage(),
        text: LocaleKeys.on_board_skip.tr(),
      ),
    );
  }

  /// Navigation Page Widget
  Widget _getNavigationWidget() {
    return Positioned(
      bottom: AppSizes.custom.value,
      right: AppSizes.medium.value,
      left: AppSizes.medium.value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Back Button
          CustomIconButton(
            onPressed: () => splashViewModel.animateToPrevPage(),
            icon: Icon(
              AppIcons.kArrowLeft,
              color: splashViewModel.isFirstPage ? AppColors.electricViolet : AppColors.whiteColor,
              size: AppSizes.ultra.value,
            ),
            border: Border.all(color: AppColors.electricViolet),
            shape: BoxShape.circle,
            backgroundColor: splashViewModel.isFirstPage ? AppColors.whiteColor : AppColors.electricViolet,
          ),
          /// Page Dots
          CustomTabPageSelector(
            selectedIndex: splashViewModel.currentPage,
            tabLenght: splashViewModel.pages.length,
          ),
          /// Next Button
          CustomIconButton(
            onPressed: () => splashViewModel.isLastPage
                ? context.goNamed(AppRouteName.signin.name)
                : splashViewModel.animateToNextPage(),
            icon: Icon(
              splashViewModel.isLastPage ? AppIcons.kLikeIcon : AppIcons.kArrowRight,
              color: AppColors.whiteColor,
              size: AppSizes.ultra.value,
            ),
            border: Border.all(color: AppColors.electricViolet),
            shape: BoxShape.circle,
            backgroundColor: AppColors.electricViolet,
          ),
        ],
      ),
    );
  }
}
