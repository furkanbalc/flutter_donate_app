import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/index.dart';
import 'package:flutter_donate_app/data/models/on_board_model.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/widgets/container/custom_clip_path_container.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/button/index.dart';
import 'package:flutter_donate_app/presentation/widgets/custom_dot_page_selector.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'widgets/onboard_widget.dart';

class OnboardView extends ConsumerStatefulWidget {
  const OnboardView({super.key});

  @override
  ConsumerState createState() => _OnboardViewState();
}

class _OnboardViewState extends ConsumerState<OnboardView> {
  late SplashViewModel _splashViewModel;

  @override
  void initState() {
    super.initState();
    _splashViewModel = ref.read(splashViewModelImp);
    _splashViewModel.setInitialScreen();
  }

  @override
  Widget build(BuildContext context) {
    _splashViewModel = ref.watch(splashViewModelImp);
    return Scaffold(
      body: SafeArea(child: _buildBody(context)),
    );
  }

  /// Body
  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        _backgroundCircle(context),
        _buildPageView(),
        _skipButton(),
        _getNavigationWidget(),
      ],
    );
  }

  /// Page View
  Widget _buildPageView() {
    return PageView(
      controller: _splashViewModel.pageController,
      onPageChanged: _splashViewModel.onPageChanged,
      children: List.generate(
        _splashViewModel.pages.length,
        (index) => _OnboardWidget(
          onBoardingModel: _splashViewModel.pages[index],
          splashViewModel: _splashViewModel,
        ),
      ),
    );
  }

  /// Background Circle Container
  Widget _backgroundCircle(BuildContext context) {
    return Center(
      child: Container(
        width: context.dynamicWidth(),
        height: context.dynamicWidth(),
        decoration: BoxDecoration(
          color: AppColors.electricViolet.withOpacity(.1),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  /// SKIP BUTTON
  Widget _skipButton() {
    return Positioned(
      right: AppSizes.low2.value,
      top: AppSizes.low2.value,
      child: CustomTextButton(
        onPressed: () => _splashViewModel.animateToLastPage(),
        text: LocaleKeys.on_board_skip.tr(),
      ),
    );
  }

  /// Navigation Page Widget
  Widget _getNavigationWidget() {
    return Positioned(
      bottom: AppSizes.high3.value,
      right: AppSizes.medium1.value,
      left: AppSizes.medium1.value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Back Button
          CustomIconButton(
            onPressed: () => _splashViewModel.animateToPrevPage(),
            icon: Icon(
              AppIcons.kArrowLeft,
              color: _splashViewModel.isFirstPage
                  ? AppColors.electricViolet
                  : AppColors.whiteColor,
              size: AppSizes.medium3.value,
            ),
            border: Border.all(color: AppColors.electricViolet),
            shape: BoxShape.circle,
            backgroundColor: _splashViewModel.isFirstPage
                ? AppColors.whiteColor
                : AppColors.electricViolet,
          ),

          /// Page Dots
          CustomDotPageSelector(
            selectedIndex: _splashViewModel.currentPage,
            tabLenght: _splashViewModel.pages.length,
          ),

          /// Next Button
          CustomIconButton(
            onPressed: () => _splashViewModel.isLastPage
                ? context.goNamed(AppRouteName.signin.name)
                : _splashViewModel.animateToNextPage(),
            icon: Icon(
              _splashViewModel.isLastPage
                  ? AppIcons.kLikeIcon
                  : AppIcons.kArrowRight,
              color: AppColors.whiteColor,
              size: AppSizes.medium3.value,
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
