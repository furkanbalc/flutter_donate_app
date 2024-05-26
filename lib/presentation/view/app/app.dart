import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/presentation/view/app/home.dart';
import 'package:flutter_donate_app/presentation/view/app/widgets/bottom_nav_items.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeView(),
      floatingActionButton: InkWell(
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

enum AppNavBarItems { home, settings, favorite, profile }
