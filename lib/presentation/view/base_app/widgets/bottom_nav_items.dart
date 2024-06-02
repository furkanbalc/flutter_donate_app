import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/bottom_bar_items.dart';

class BottomNavItems {
  static List<NavigationDestination> get views => [
        NavigationDestination(
          selectedIcon: const Icon(AppIcons.kHomeFilledIcon),
          icon: const Icon(AppIcons.kHomeOutlinedIcon),
          label: BottomBarItems.home.value,
        ),
        NavigationDestination(
          selectedIcon: const Icon(AppIcons.kGiftFilledIcon),
          icon: const Icon(AppIcons.kGiftOutlinedIcon),
          label: BottomBarItems.product.value,
        ),
        NavigationDestination(
          selectedIcon: const Icon(AppIcons.kMessageFilledIcon),
          icon: const Icon(AppIcons.kMessageOutlinedIcon),
          label: BottomBarItems.message.value,
        ),
        NavigationDestination(
          selectedIcon: const Icon(AppIcons.kUserFilledIcon),
          icon: const Icon(AppIcons.kUserOutlinedIcon),
          label: BottomBarItems.profile.value,
        ),
      ];
}
