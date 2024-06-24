import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/router/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/viewmodel/base_app/base_app_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var viewModel = ref.watch(baseAppViewModelImp);
    return NavigationBar(
      surfaceTintColor: AppColors.cascadingWhite,
      selectedIndex: _calculateSelectedIndex(context),
      backgroundColor: AppColors.whiteColor,
      indicatorColor: AppColors.electricViolet.withOpacity(.2),
      onDestinationSelected: (value) =>
          _onItemTapped(context, viewModel, value),
      destinations: viewModel.views,
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(AppRouteName.home.path)) {
      return 0;
    }
    if (location.startsWith(AppRouteName.product.path)) {
      return 1;
    }
    if (location.startsWith(AppRouteName.message.path)) {
      return 2;
    }
    if (location.startsWith(AppRouteName.profile.path)) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(
    BuildContext context,
    BaseAppViewModel viewModel,
    int index,
  ) {
    viewModel.selectedIndex = index;
    switch (index) {
      case 0:
        context.goNamed(AppRouteName.home.name);
      case 1:
        context.goNamed(AppRouteName.product.name);
      case 2:
        context.goNamed(AppRouteName.message.name);
      case 3:
        context.goNamed(AppRouteName.profile.name);
    }
  }
}
