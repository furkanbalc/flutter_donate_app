import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/app/home.dart';
import 'package:flutter_donate_app/presentation/view/app/profile/profile.dart';
import 'package:flutter_donate_app/presentation/view/app/widgets/bottom_nav_items.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signin/signin_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/profile_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  int _selectedIndex = 0;
  final List<Widget> _bodies = [
    const HomeView(),
    const Center(child: Text('3')),
    const Center(child: Text('4')),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cascadingWhite,
      body:  _bodies[_selectedIndex],
      floatingActionButton: Visibility(
        visible: _selectedIndex == 0,
        child: InkWell(
          onTap: () {
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
              largeSize: 20,
              isLabelVisible: true,
              label: const Icon(AppIcons.kAddCircleIcon, size: 12, color: Colors.white),
              offset: const Offset(8, -8),
              backgroundColor: AppColors.redColor.withAlpha(200),
              child: const Icon(AppIcons.kGiftFilledIcon,size: 32,color: AppColors.electricViolet),
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        backgroundColor: AppColors.whiteColor,
        indicatorColor: AppColors.electricViolet.withOpacity(.2),
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        destinations: BottomNavItems.views,
      ),
    );
  }
}
