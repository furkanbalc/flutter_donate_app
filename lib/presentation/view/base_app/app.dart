import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/base_app/widgets/bottom_nav_bar.dart';
import 'package:flutter_donate_app/presentation/viewmodel/base_app/base_app_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  late BaseAppViewModel baseAppViewModel;

  @override
  void initState() {
    super.initState();
    baseAppViewModel = ref.read(baseAppViewModelImp);
  }

  @override
  Widget build(BuildContext context) {
    baseAppViewModel = ref.watch(baseAppViewModelImp);
    return Scaffold(
      backgroundColor: AppColors.cascadingWhite,
      body: baseAppViewModel.body(),
      floatingActionButton: Visibility(
        visible: baseAppViewModel.isSeenFabButton,
        child: _builAddProductButton(context),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  /// Add Product Button
  Widget _builAddProductButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Padding(
        padding: context.paddings.allLow,
        child: Badge(
          largeSize: 20,
          isLabelVisible: true,
          label: const Icon(AppIcons.kAddCircleIcon, size: 12, color: Colors.white),
          offset: const Offset(8, -8),
          backgroundColor: AppColors.redColor.withAlpha(200),
          child: const Icon(AppIcons.kGiftFilledIcon, size: 32, color: AppColors.electricViolet),
        ),
      ),
    );
  }
}
