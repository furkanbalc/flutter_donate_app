import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/base_app/widgets/bottom_nav_bar.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  App({super.key, required this.child});

  final Widget child;

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
  void deactivate() {
    super.deactivate();
    baseAppViewModel.reset();
  }

  @override
  Widget build(BuildContext context) {
    baseAppViewModel = ref.watch(baseAppViewModelImp);
    return Scaffold(
      body: widget.child,
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
