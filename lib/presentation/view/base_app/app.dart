import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/presentation/view/base_app/widgets/bottom_nav_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key, required this.child});

  final Widget child;


  @override
  ConsumerState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: widget.child,
      floatingActionButton: _builAddProductButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  /// Add Product Button
  Widget _builAddProductButton(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      elevation: 0,
      backgroundColor: AppColors.electricViolet,
      onPressed: () {},
      child: Padding(
        padding: context.paddings.allLow2,
        child: const Icon(AppIcons.kAddIcon, size: 32, color: AppColors.whiteColor),
      ),
    );
  }
}
