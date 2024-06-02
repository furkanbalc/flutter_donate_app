import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      selectedIndex: viewModel.selectedIndex,
      backgroundColor: AppColors.whiteColor,
      indicatorColor: AppColors.electricViolet.withOpacity(.2),
      onDestinationSelected: viewModel.onDestinationSelected,
      destinations: viewModel.views,
    );
  }
}
